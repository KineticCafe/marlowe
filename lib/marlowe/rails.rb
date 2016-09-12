# frozen_string_literal: true

module Marlowe
  class Railtie < Rails::Railtie # :nodoc:
    initializer 'marlowe.configure_rails_initialization' do
      config = app.config

      opts = {
        header: config.try(:marlowe_header) || config.try(:marlowe_correlation_header),
        handler: config.try(:marlowe_request_id_handler),
        return: config.try(:marlowe_return_request_id),
        action_dispatch: config.try(:marlowe_replace_action_dispatch_request_id)
      }.compact

      if opts[:action_dispatch]
        app.middleware.insert_before ActionDispatch::RequestId,
          Marlowe::Middleware, opts
        app.middleware.delete ActionDispatch::RequestId
      else
        app.middleware.insert_before Rails::Rack::Logger, Marlowe::Middleware,
          opts
      end
    end

    def app #:nodoc:
      Rails.application
    end
  end
end
