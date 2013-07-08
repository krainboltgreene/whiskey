module Whiskey
  class Server
    class Interpretor
      attr_reader :input

      def initialize(input)
        @input = AltStruct.new(input)
      end

      def call
        case input.resource.to_s
          when "world" then World.new
        end
      end

      def response
        call
      end
    end
  end
end
