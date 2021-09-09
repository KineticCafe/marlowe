# frozen_string_literal: true

# Marlowe, a correlation id injector.
module Marlowe
  VERSION = "2.0" #:nodoc:

  require "marlowe/middleware"
  require "marlowe/rails" if defined? Rails::Railtie

  autoload :Formatter, "marlowe/formatter"
  autoload :SimpleFormatter, "marlowe/simple_formatter"
end
