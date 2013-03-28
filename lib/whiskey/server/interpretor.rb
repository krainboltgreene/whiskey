module Whiskey
  class Server
    class Interpretor
      attr_accessor :input

      def initialize(input)
        self.input = input
      end

      def call
        true
      end

      def result
        call unless invalid?
        return input
      end

      def invalid?
        input.has_key?("error")
      end
    end
  end
end
