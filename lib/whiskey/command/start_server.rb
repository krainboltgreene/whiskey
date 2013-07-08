module Whiskey
  class Command < Thor
    class StartServer
      def initialize
      end

      def call
        Whiskey::Server.configure(host: @host, port: @port)
      end
    end
  end
end
