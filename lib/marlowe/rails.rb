module Marlowe
  class Railtie < Rails::Railtie
    initializer 'marlowe.configure_rails_initialization' do
      app.middleware.insert_before Rails::Rack::Logger, Marlowe::Middleware
    end

    #:nodoc:
    def app
      Rails.application
    end
  end
end
