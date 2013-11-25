module Whiskey
  class Server
    class Action
      class Verb
        def initialize(klass)
          @action = klass
        end

        def name
          case @action.name
            when "Create" then "PUSH"
            when "Update" then "PUSH"
            when "List" then "PULL"
            when "Show" then "PULL"
          end
        end

        def to_hash
          {
            name => command
          }
        end

        def command
          "#{self.class.name.deconstantize.demodulize} " if input?
        end

        private

        def input?
          @action.input?
        end
      end
    end
  end
end
