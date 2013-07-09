module Whiskey
  class Server
    class Interpretor
      attr_reader :response

      def initialize(input)
        @instructions = input
        @repsonse = if has_scope? then call else not_found end
      end

      def call
        if command.valid?
          @response = { status: 200 }
        else
          @response = Error.new(:unprocessable_entity).to_hash
        end
      end

      def instructions
        AltStruct.new(@instructions)
      end

      private

      def command
        scope.new(instructions.command.to_s)
      end

      def scope
        "::Command::#{instructions.scope}Command".camelcase.constantize
      end

      def has_scope?
        @instructions.has_key?("scope")
      end

      def not_found
        Error.new(:not_found).to_hash
      end
    end
  end
end
