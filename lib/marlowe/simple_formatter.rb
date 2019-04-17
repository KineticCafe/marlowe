# frozen_string_literal: true

require 'request_store'

module Marlowe
  # Marlowe::SimpleFormatter is a subclass of
  # +ActiveSupport::Logger::SimpleFormatter+ that adds a correlation id
  # string to a rails log.
  class SimpleFormatter < ActiveSupport::Logger::SimpleFormatter
    # Overrides the formatter return to add the correlation id.
    def call(severity, timestamp, progname, msg)
      "[#{RequestStore.store[:correlation_id]}] #{super}"
    end
  end
end
