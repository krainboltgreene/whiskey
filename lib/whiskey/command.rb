require "thor"
require "whiskey"

module Whiskey
  class Command < Thor
    include Thor::Actions

    attr_accessor :values

    def self.source_root
      File.join(File.dirname(__FILE__), "command", "templates")
    end

    desc "build NAME", "Builds a new whiskey project from the scaffold"
    def build(name)
      @values = AltStruct.new
      Build.new(self, name).call
    end

    desc "server [start|stop]", "Starts the whiskey server up"
    def server(switch)
      case switch
        when "start" then StartServer.new.call
      end
    end
  end
end

require_relative "command/build"
require_relative "command/start_server"
