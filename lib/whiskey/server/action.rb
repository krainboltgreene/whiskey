module Whiskey
  class Server
    class Action

      def initialize(*args)
        raise "Not yet implemented"
      end

      def to_hash
        raise "Not yet implemented"
      end

      def to_verb
        case name
          when "ListAction" then "PULL"
          when "CreateAction" then "PUSH"
          when "ShowAction" then "PULL"
          when "UpdateAction" then "PUSH"
        end
      end
    end
  end
end
