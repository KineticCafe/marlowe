require 'rack'
require 'request_store'

module Marlowe
  # Marlowe correlation id middleware. Including this into your
  # middleware stack will add a 'Correlation-Id' header as an incoming
  # request, and save that id in a request session variable.

  class Middleware
    # Sets the the rack application to +app+
    def initialize(app)
      @app = app
    end

    # Stores the incoming correlation id from the +env+ hash. If the correlation
    # id has not been sent, a new UUID is generated and the +env+ is modified.
    def call(env)
      env['HTTP_CORRELATION_ID'] ||= SecureRandom.uuid
      RequestStore.store[:correlation_id] = env['HTTP_CORRELATION_ID']

      @status, @headers, @response = @app.call(env)
      [@status, @headers, @response]
    end
  end
end
