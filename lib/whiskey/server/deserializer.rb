module Whiskey
  class Server
    class Deserializer
      attr_reader :raw
      attr_accessor :error

      def initialize(raw)
        @raw = raw
        @errors = []
      end

      def load
        begin
          MultiJson.load(raw.chomp!)
        rescue Exception => error
          @errors << "Could not read JSON"
        end
      end

      def errors
        {
          errors: @errors
        }
      end
    end
  end
end
