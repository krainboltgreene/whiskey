module Whiskey
  class Server
    module Control
      def self.included(base)
        base.extend ClassMethods
      end

      module ClassMethods
        def to_resource
          name.demodulize.downcase.gsub(/control/, '')
        end

        def to_route
          {
            to_resource => actions.map(&:to_verb)
          }
        end

        def controls
          constants.select do |constant|
            constant.to_s.end_with?("Control")
          end.map(&method(:const_get))
        end

        def actions
          constants.select do |constant|
            constant.to_s.end_with?("Action")
          end.map(&method(:const_get))
        end
      end
    end
  end
end
