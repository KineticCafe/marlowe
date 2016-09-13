# frozen_string_literal: true

require 'rack'
require 'request_store'
require 'securerandom'

module Marlowe
  # Marlowe correlation id middleware. Including this into your middleware
  # stack will add a correlation id header as an incoming request, and save
  # that id in a request session variable.
  class Middleware
    # The name of the default header to look for and put the correlation id in.
    CORRELATION_HEADER = 'X-Request-Id' #:nodoc:

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
    def initialize(app, opts = {})
      @app = app
      @header, @http_header = format_header_name(
        opts[:header] || opts[:correlation_header] || CORRELATION_HEADER
      )
      @handler = opts.fetch(:handler, :clean)
      @return = opts.fetch(:return, true)
      @action_dispatch = opts.fetch(:action_dispatch, false)
    end

    # Stores the incoming correlation id from the +env+ hash. If the correlation
    # id has not been sent, a new UUID is generated and the +env+ is modified.
    def call(env)
      req_id = make_request_id(env[@http_header])
      RequestStore.store[:correlation_id] = env[@http_header] = req_id

      if @action_dispatch
        req = ActionDispatch::Request.new(env)
        req.request_id = req_id
      end

      @app.call(env).tap { |_status, headers, _body|
        if @return
          headers[@header] = if @action_dispatch
                               req.request_id
                             else
                               RequestStore.store[:correlation_id]
                             end
        end
      }
    end

    private

    def format_header_name(header)
      [
        header.to_s.tr('_', '-').freeze,
        "HTTP_#{header.to_s.tr('-', '_').upcase}"
      ]
    end

    def make_request_id(request_id)
      if @handler == :simple
        simple(request_id)
      elsif @handler.kind_of?(Proc)
        simple(@handler.call(request_id))
      else
        clean(request_id)
      end
    end

    def clean(request_id)
      simple(request_id).gsub(/[^\w\-]/, '')[0, 255]
    end

    def simple(request_id)
      if request_id && !request_id.empty? && request_id !~ /\A[[:space]]*\z/
        request_id
      else
        SecureRandom.uuid
      end
    end
  end
end
