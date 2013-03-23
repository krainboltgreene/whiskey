require "coveralls"
Coveralls.wear! do
  add_filter "/test/"
end
require "minitest/autorun"
require "mocha/setup"
require "pry"
require "whiskey"


class MiniTestCase < MiniTest::Unit::TestCase

end
