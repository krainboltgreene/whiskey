module Whiskey
  class Server
    class Action
      class Command < Parslet::Parser
        rule(:space) do
          match["\s"].repeat
        end

        rule(:space?) do
          space.maybe
        end

        rule(:control) do
          str("account").as(:control)
        end

        rule(:action) do
          str("create").as(:action)
        end

        rule(:command) do
          control >> space >> action >> space >> arguments
        end

        root(:command)
      end
    end
  end
end
