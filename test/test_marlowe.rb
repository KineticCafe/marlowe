# frozen_string_literal: true

require "minitest_config"

class TestMarlowe < Minitest::Test
  include Rack::Test::Methods

  attr_reader :marlowe_options

  def setup
    @marlowe_options = {}
    Marlowe::Config.send(:clear_global!)
  end

  def app
    options = marlowe_options
    Rack::Builder.new do
      use Marlowe::Middleware, options

      run lambda { |_env|
        [
          200,
          {"Content-Type" => "text/plain"},
          [RequestStore[:correlation_id]]
        ]
      }
    end
  end

  def test_default_config_no_header_value
    get "/"
    assert has_header?("X-Request-Id")
    refute_empty get_header("X-Request-Id")
    assert_equal get_header("X-Request-Id"), last_response.body
  end

  def test_default_config_with_header_value
    get "/", {}, {"HTTP_X_REQUEST_ID" => "testvalue"}
    assert has_header?("X-Request-Id")
    refute_empty get_header("X-Request-Id")
    assert_equal get_header("X-Request-Id"), last_response.body
    assert_equal "testvalue", get_header("X-Request-Id")
  end

  def test_header_config_no_header_value
    marlowe_options[:header] = "Correlation-Id"
    get "/"
    assert has_header?("Correlation-Id")
    refute_empty get_header("Correlation-Id")
    assert_equal get_header("Correlation-Id"), last_response.body
  end

  def test_header_config_no_header_with_header_value
    marlowe_options[:header] = "Correlation-Id"
    get "/", {}, {"HTTP_CORRELATION_ID" => "testvalue"}
    assert has_header?("Correlation-Id")
    refute_empty get_header("Correlation-Id")
    assert_equal get_header("Correlation-Id"), last_response.body
    assert_equal "testvalue", get_header("Correlation-Id")
  end

  def test_handler_config_default_handler
    get "/", {}, {"HTTP_X_REQUEST_ID" => "test+value"}
    assert has_header?("X-Request-Id")
    refute_empty get_header("X-Request-Id")
    assert_equal get_header("X-Request-Id"), last_response.body
    assert_equal "testvalue", get_header("X-Request-Id")
  end

  def test_handler_config_with_simple_handler
    marlowe_options[:handler] = :simple
    get "/", {}, {"HTTP_X_REQUEST_ID" => "test+value"}
    assert has_header?("X-Request-Id")
    refute_empty get_header("X-Request-Id")
    assert_equal get_header("X-Request-Id"), last_response.body
    assert_equal "test+value", get_header("X-Request-Id")
  end

  def test_handler_config_with_proc_handler
    marlowe_options[:handler] = ->(item) { item && item.reverse || SecureRandom.uuid }
    get "/", {}, {"HTTP_X_REQUEST_ID" => "test+value"}
    assert has_header?("X-Request-Id")
    refute_empty get_header("X-Request-Id")
    assert_equal get_header("X-Request-Id"), last_response.body
    assert_equal "eulav+tset", get_header("X-Request-Id")
  end

  def test_handler_config_with_proc_handler_returning_nil
    marlowe_options[:handler] = ->(_item) {}
    get "/", {}, {"HTTP_X_REQUEST_ID" => "test+value"}
    assert has_header?("X-Request-Id")
    refute_empty get_header("X-Request-Id")
    assert_equal get_header("X-Request-Id"), last_response.body
    assert_match(/\A[-\w]+\z/, get_header("X-Request-Id"))
  end

  def test_return_config_false
    marlowe_options[:return] = false
    get "/"
    refute has_header?("X-Request-Id")
    assert_equal RequestStore[:correlation_id], last_response.body
  end
end
