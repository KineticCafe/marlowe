require 'minitest_config'

class TestMarlowe < Minitest::Test
  def setup
    @app = RackApp.new
    @middleware = Marlowe::Middleware.new(@app)
  end

  def test_no_header
    @middleware.call({})
    refute_empty @app.coordination_id
  end

  def test_with_header
    @middleware.call({'HTTP_CORRELATION_ID' => 'testvalue'})
    refute_empty @app.coordination_id
    assert_equal 'testvalue', @app.coordination_id
  end
end
