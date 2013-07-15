module Whiskey
  class Command < Thor
    class Build
      extend Forwardable

      attr_reader :command, :name

      def_delegator :@command, :empty_directory
      def_delegator :@command, :directory
      def_delegator :@command, :template
      def_delegator :@command, :inside

      def initialize(command, name)
        @command = command
        @name = name
      end

      def call
        create_root
        setup_root
        setup_server
        setup_static
        setup_db
      end

      private

      def create_root
        empty_directory(name)
        command.destination_root = name
      end

      def setup_root
        template("Gemfile")
        template("gitignore", ".gitignore")
        template("LICENSE.txt")
        template("Thorfile")
        template("server.rb")
        empty_directories("script", "log", "tmp", "doc")
      end

      def empty_directories(*directories)
        directories.each { |directory| empty_directory directory }
      end

      def setup_server
        inside("lib") do
          template("example.rb", "#{name}.rb")
          template("models.rb")
          setup_models
        end
      end

      def setup_models
        directory("models")
      end

      def setup_static
        inside("static") do
          template("welcome.txt")
        end
      end

      def setup_db
        inside("db") do
          # if persistence == activerecord
          empty_directory("migrations")
          template("seed.rb")
        end
      end
    end
  end
end
