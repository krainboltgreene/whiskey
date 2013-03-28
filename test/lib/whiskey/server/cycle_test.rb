require "helper"
require "whiskey/server/cycle"

class TestWhiskeyServerCycle < MiniTestCase
  def setup
    @cycle = Whiskey::Server::Cycle.new("foo")
  end

  def test_initialize
    Whiskey::Server::Cycle.any_instance.stubs(:deserialized)
    expected = "foo"
    actual = @cycle.to_s
    assert_equal(expected, actual)
  end
end

