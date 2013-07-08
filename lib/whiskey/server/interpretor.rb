module Whiskey
  class Server
    class Interpretor
      attr_reader :input

      def initialize(input)
        @input = AltStruct.new(input)
      end

      def call
        true
      end

      def response
        call and input.merge(status: 200)
      end
    end
  end
end
