# frozen_string_literal: true

# Marlowe, a correlation id injector.
module Marlowe
  VERSION = '3.0' #:nodoc:

  require 'marlowe/config'
  require 'marlowe/middleware'
  require 'marlowe/rails' if defined? Rails::Railtie

  autoload :Formatter, 'marlowe/formatter'
  autoload :SimpleFormatter, 'marlowe/simple_formatter'

  class << self
    # Configure Marlowe
    def configure(&block)
      Marlowe::Config.configure(&block)
    end

    # Make a Marlowe request ID
    def make_request_id(request_id, config = Marlowe::Config.global)
      if config.handler == :simple
        simple(request_id)
      elsif config.handler.kind_of?(Proc)
        simple(config.handler.call(request_id))
      else
        clean(request_id)
      end
    end

    private

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
