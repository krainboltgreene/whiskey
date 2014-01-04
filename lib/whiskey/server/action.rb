require_relative "action/verb"

module Whiskey
  class Server
    # The Action class is an abstract class that passes
    # action-like behavior to the subclasses.
    class Action
      @@input = true

      def self.to_verb
        Verb.new(self, @@input).to_hash
      end

      def input?
        @@input
      end

      def initialize(*args)
        raise "Not yet implemented"
      end

      def to_hash
        raise "Not yet implemented"
      end
    end
  end
end
