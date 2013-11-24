module Whiskey
  class Server
    class Action
      class Verb
        def initialize(klass)
          @action = klass
        end

        def to_s
          case @action
            when List then "PULL"
            when Create then "PUSH"
            when Show then "PULL"
            when Update then "PUSH"
          end
        end

        def to_hash
          {
            to_s => command
          }
        end

        def command
          if input?
            "#{name.deconstantize.demodulize} "
          end
        end

        private

        def input?
          @action.input?
        end
      end
    end
  end
end
