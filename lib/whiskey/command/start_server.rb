module Whiskey
  class Command < Thor
    class StartServer
      def initialize(host = nil, port = nil, environment = "development")
        ENV["WHISKEY_HOST"] = host
        ENV["WHISKEY_PORT"] = port
        ENV["WHISKEY_ENVIRONMENT"] = environment
      end

      def call
        load File.join(Dir.pwd, "server")
      end
    end
  end
end
