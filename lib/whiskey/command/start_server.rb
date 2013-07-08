module Whiskey
  class Command < Thor
    class StartServer
      def initialize(host = "127.0.0.1", port = "9000")
        require "whiskey/server"
        @host = host
        @port = port
      end

      def call
        Whiskey::Server.configure(host: @host, port: @port)
      end
    end
  end
end
