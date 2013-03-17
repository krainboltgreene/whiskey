require "helper"

class TestWhiskeyVersion < MiniTestCase
  def test_version
    assert(defined?(Whiskey::VERSION))
  end
end
