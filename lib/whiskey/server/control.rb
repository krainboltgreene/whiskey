module Whiskey
  class Server
    module Control
      def self.included(base)
        base.extend ClassMethods
      end

      module ClassMethods
        def controls
          constants.map(&method(:const_get)).select do |constant|
            constant.respond_to?(:to_resource)
          end
        end

        def to_resources
          controls.map(&:to_resource).inject(&:merge!)
        end

        def to_resource
          {
            name.demodulize.downcase => actions.map(&:to_verb).inject(&:merge!)
          }
        end

        def actions
          constants.map(&method(:const_get)).select do |constant|
            constant.respond_to?(:to_verb)
          end
        end
      end
    end
  end
end
