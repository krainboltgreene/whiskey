module Whiskey
  class Command < Thor
    class StartServer
        require "whiskey/server"
      def initialize(host = nil, port = nil, environment = "development")
        ENV["WHISKEY_HOST"] = host
        ENV["WHISKEY_PORT"] = port
      end

      def call
        Whiskey::Server.configure(host: @host, port: @port)
      end
    end
  end
end
