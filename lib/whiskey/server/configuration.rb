module Whiskey
  class Server
    class Configuration < AltStruct

      def control_class
        "#{namespace}::Control"
      end

      def control
        if defined?(control_class)
          control_class.constantize
        end
      end

      def to_s
        "#{host}:#{port}"
      end
    end
  end
end
