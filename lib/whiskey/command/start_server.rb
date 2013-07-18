module Whiskey
  class Command < Thor
    class StartServer
        require "whiskey/server"
        @host = host
        @port = port
      def initialize(host = nil, port = nil, environment = "development")
      end

      def call
        Whiskey::Server.configure(host: @host, port: @port)
      end
    end
  end
end
