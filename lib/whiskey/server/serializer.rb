module Whiskey
  class Server
    class Serializer
      attr_reader :data

      def initialize(raw)
        @errors = []
        begin
          @data = MultiJson.dump(raw)
          @valid = true
        rescue Exception => error
          puts error
          @valid = false
        end
      end

      def valid?
        @valid
      end
    end
  end
end
