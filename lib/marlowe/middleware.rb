require 'rack'
require 'request_store'
require 'securerandom'

module Marlowe
  # Marlowe correlation id middleware. Including this into your
  # middleware stack will add a correlation id header as an incoming
  # request, and save that id in a request session variable.

  # Name of the default header to look for and put the correlation id in.
  CORRELATION_HEADER = 'Correlation-Id'.freeze

  class Middleware
    # Sets the the rack application to +app+
    def initialize(app, opts={})
      @app = app
      @correlation_header = format_http_header(opts[:correlation_header] || Marlowe::CORRELATION_HEADER)
    end

    # Stores the incoming correlation id from the +env+ hash. If the correlation
    # id has not been sent, a new UUID is generated and the +env+ is modified.
    def call(env)
      env[@correlation_header] ||= SecureRandom.uuid
      RequestStore.store[:correlation_id] = env[@correlation_header]

      @status, @headers, @response = @app.call(env)
      [@status, @headers, @response]
    end

    private

    def format_http_header(header)
      ("HTTP_" + header.gsub(/-/, '_').upcase).freeze
    end
  end
end
