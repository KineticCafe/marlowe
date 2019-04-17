# frozen_string_literal: true

require 'rack'
require 'request_store'
require 'securerandom'

module Marlowe
  # Marlowe correlation id middleware. Including this into your middleware
  # stack will capture or add a correlation id header on an incoming request,
  # and save that id in a request session variable.
  class Middleware
    # The name of the default header to look for and put the correlation id in.
    CORRELATION_HEADER = Marlowe::Config::CORRELATION_HEADER # :nodoc:

    # Configure the Marlowe middleware to call +app+ with options +opts+.
    #
    # === Options
    #
    # <tt>:header</tt>:: The name of the header to inspect. Defaults to
    #                    'X-Request-Id'. Also available as
    #                    <tt>:correlation_header</tt>.
    # <tt>:handler</tt>:: The handler for request correlation IDs. Defaults to
    #                     sanitizing provided request IDs or generating a UUID.
    #                     If <tt>:simple</tt> is provided, provided request IDs
    #                     will not be sanitized. A callable (expecting a single
    #                     input of any possible existing request ID) may be
    #                     provided to introduce more complex request ID
    #                     handling.
    # <tt>:return</tt>:: If +true+ (the default), the request correlation ID
    #                    will be returned as part of the response headers.
    # <tt>:action_dispatch</tt>:: If +true+, Marlowe will add code to behave
    #                             like <tt>ActionDispatch::RequestId</tt>.
    #                             Depends on <tt>ActionDispatch::Request</tt>.
    def initialize(app, opts = nil)
      @app = app
      @config = Marlowe::Config.override(opts)
    end

    # Stores the incoming correlation id from the +env+ hash. If the correlation
    # id has not been sent, a new UUID is generated and the +env+ is modified.
    def call(env)
      req_id = Marlowe.make_request_id(env[config.http_header], config)
      RequestStore.store[:correlation_id] = env[config.http_header] = req_id

      if config.action_dispatch
        req = ActionDispatch::Request.new(env)
        req.request_id = req_id
      end

      app.call(env).tap { |_status, headers, _body|
        if config.return
          headers[config.header] =
            if config.action_dispatch
              req.request_id
            else
              RequestStore.store[:correlation_id]
            end
        end
      }
    end

    private

    attr_reader :app, :config
  end
end
