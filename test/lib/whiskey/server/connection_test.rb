require "helper"
require "whiskey/server/connection"

class TestWhiskeyServerConnection < MiniTestCase
  def setup
    @socket = mock
    @socket.stubs(:peeraddr).returns(["AF_INET", 9999, "foo.example.com", "127.0.0.1"])
    @connection = Whiskey::Server::Connection.new(@socket)
  end

  def test_id
    expected = "127.0.0.1:9999"
    actual = @connection.id
    assert_equal(expected, actual)
  end

  def test_socket
    refute(@connection.socket.nil?, "Connection has no socket")
  end

  def test_write
    @socket.expects(:write).with("foo").at_least_once
    @connection.write("foo")
  end

  def test_readpartial
    @socket.expects(:readpartial).with(4096).at_least_once
    @connection.readpartial(4096)
  end

  def test_readpartial
    @socket.expects(:peeraddr).at_least_once
    @connection.peeraddr
  end
end

