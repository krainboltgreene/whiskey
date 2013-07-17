module Whiskey
  class Command < Thor
    class Build
      extend Forwardable

      RUBIES = ["rbx", "jruby", "ruby-2.0.0"]
      RUBY_ASK = "Which Ruby do you want to use?\n\n\t- ruby-2.0.0\n\t- rubinius\n\t- jruby\n"

      attr_reader :command, :name

      def_delegator :@command, :empty_directory
      def_delegator :@command, :directory
      def_delegator :@command, :template
      def_delegator :@command, :inside
      def_delegator :@command, :run
      def_delegator :@command, :ask

      def initialize(command, name)
        @command = command
        @name = @command.values.name = name
      end

      def call
        create_root
        setup_root
        setup_server
        setup_db
        setup_ruby
        inside(name) do
          run("git init")
        end
        say("You should now run: bundle install")
      end

      private

      def create_root
        empty_directory(name)
        command.destination_root = name
      end

      def setup_ruby
        @command.values.ruby = ask(RUBIES_ASK, limit_to: RUBIES)
        template("ruby-version", ".ruby-version")
        template("ruby-gemset", ".ruby-gemset")
      end

      def setup_root
        template("Gemfile")
        template("gitignore", ".gitignore")
        template("LICENSE.txt")
        template("Thorfile")
        template("Procfile")
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
          template("action.rb")
          template("controls.rb")
          setup_models
          setup_controls
        end
      end

      def setup_models
        directory("models")
      end

      def setup_controls
        directory("controls")
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
