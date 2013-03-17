require 'coveralls'
Coveralls.wear! do
  add_filter "/test/"
end
require 'minitest/autorun'
require 'pry'
require 'whiskey'


class MiniTestCase < MiniTest::Unit::TestCase

end
