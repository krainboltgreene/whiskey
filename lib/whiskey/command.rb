require "thor"
require "whiskey"
require "active_support/core_ext"
require_relative "command/build"

module Whiskey
  class Command < Thor
    include Thor::Actions

    attr_accessor :name

    def self.source_root
      File.join(File.dirname(__FILE__), "command", "templates")
    end

    desc "build NAME", "Builds a new whiskey project from the scaffold"
    def build(name)
      Build.new(self, name).call
    end

      end
    end
  end
end
