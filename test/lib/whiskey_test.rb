require 'helper'

class TestWhiskey < MiniTestCase
  def test_that_namespace_defined
    assert(defined?(Whiskey))
  end
end
