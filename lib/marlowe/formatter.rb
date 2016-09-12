# frozen_string_literal: true

require 'request_store'

module Marlowe
  # Marlowe::Formatter is a subclass of +ActiveSupport::Logger::Formatter+
  # that adds a correlation id string to a rails log.
  class Formatter < ActiveSupport::Logger::Formatter
    # Overrides the formatter return to add the correlation id.
    def call(_severity, _timestamp, _progname, _msg)
      "[#{RequestStore.store[:correlation_id]}] #{super}"
    end
  end
end
