module Whiskey
  class Server
    # The Interpretor class takes the deserialized content and determines if
    # the request is actionable or if it needs to be ignored.
    class Interpretor
      extend Forwardable

      def_delegator :instruction, :resource
      def_delegator :instruction, :verb
      def_delegator :instruction, :parameters

      def initialize(input)
        @instruction = input
      end

      def response
        if valid_input?
          router
        else
          Error.new(:not_found)
        end
      end

      def router
        Router.new(resource, verb, parameters)
      end

      def instruction
        AltStruct.new(@instruction)
      end

      private

      def valid_input?
        has_resource? && has_verb? && router.valid_route?
      end

      def has_resource?
        instruction.respond_to?("resource")
      end

      def has_verb?
        instruction.respond_to?("verb")
      end
    end
  end
end
