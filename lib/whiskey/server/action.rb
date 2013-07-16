module Whiskey
  class Server
    class Action
      def self.to_verb
        case name.demodulize
          when "ListAction" then "PULL"
          when "CreateAction" then "PUSH"
          when "ShowAction" then "PULL"
          when "UpdateAction" then "PUSH"
        end
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
