require "thor"
require "whiskey"
require "pry"


module Whiskey
  class Command < Thor
    include Thor::Actions

    def self.source_root
      File.join(File.dirname(__FILE__), "command", "templates")
    end

    desc "build NAME", "Builds a new whiskey project from the scaffold"
    def build(name)
      empty_directory(name)
      self.destination_root = name
      template("Gemfile")
      template("gitignore", ".gitignore")
      template("LICENSE.txt")
      template("Thorfile")
      template("server.rb")
      directory("script")

      empty_directory("lib")
      inside("lib") do
        template("example.rb", "#{name}.rb")
        template("models.rb")
        empty_directory("models")
        inside("models") do
          template("account.rb")
          template("place.rb")
        end
      end

      empty_directory("static")
      inside("static") do
        template("welcome.txt")
      end

      empty_directory("db")
      inside("db") do
        # if persistence == activerecord
        empty_directory("migrations")
        template("seed.rb")
      end

      empty_directory("log")
      empty_directory("tmp")
      empty_directory("doc")
    end
  end
end
