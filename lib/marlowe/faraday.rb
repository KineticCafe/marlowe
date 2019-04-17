# frozen_string_literal: true

require 'marlowe'

# Marlowe correlation ID middleware for Faraday. Including this into your
# request middleware stack will use the captured correlation ID.
class Marlowe::Faraday < Faraday::Middleware
  def initialize(app, opts = {})
    super(app)
    @config = Marlowe::Config.override(opts)
  end

  def call(env)
    env[:request_headers][@config.header] =
      Marlowe.make_request_id(RequestStore[:correlation_id], @config)
    @app.call(env)
  end
end

Faraday::Request.register_middleware marlowe: -> { Marlowe::Faraday }
