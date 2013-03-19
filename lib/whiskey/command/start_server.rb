module Whiskey
  class Command < Thor
    class StartServer
      def initialize
      end

      def call
        require File.expand_path("./server")
      end
    end
  end
end
