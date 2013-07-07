module Whiskey
  class Server
    class Deserializer
      attr_reader :raw
      attr_accessor :error

      def initialize(raw)
        @raw = raw
      end

      def load
        MultiJson.load(raw.chomp!)
      end
    end
  end
end
