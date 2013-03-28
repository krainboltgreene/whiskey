require "helper"
require "whiskey/server"

class TestWhiskeyServerHandler < MiniTestCase
  def setup
    @connection = mock
    @handler = Whiskey::Server::Handler.new(@connection)
  end

  # def initialize(socket)
  #   self.connection = Connection.new(socket)
  # end
  def test_initialize
    expected = @connection
    actual = @handler.connection
    assert_equal(expected, actual)
  end
end
