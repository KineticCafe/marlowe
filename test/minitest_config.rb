# frozen_string_literal: true

gem "minitest"

require "rack/test"
require "rack/mock"
require "minitest/autorun"
require "minitest/focus"
require "minitest/moar"

require "marlowe"

RackV1 = Rack.release.start_with?("1.")

module NormalizeRackResponseHeaders
  private

  def has_header?(key)
    if RackV1
      last_response.header.key?(key)
    else
      last_response.has_header?(key)
    end
  end

  def get_header(key)
    if RackV1
      last_response.header[key]
    else
      last_response.get_header(key)
    end
  end
end

class Minitest::Test
  include NormalizeRackResponseHeaders
end
