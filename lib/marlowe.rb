# Marlowe, a correlation id injector.
module Marlowe
  VERSION = '1.0.2' #:nodoc:

  require 'marlowe/middleware'
  require 'marlowe/rails' if defined? Rails::Railtie

  autoload :Formatter, 'marlowe/formatter'
  autoload :SimpleFormatter, 'marlowe/simple_formatter'
end
