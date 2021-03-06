module Whiskey
  class Command < Thor
    # The Build class is how we scaffold out an entire Whiskey application from
    # scratch.
    class Build
      extend Forwardable

      RUBIES = ["rbx", "jruby", "ruby-2.0.0"]
      RUBIES_ASK = <<-ASK
      Which Ruby do you want to use?

      \t- ruby-2.0.0
      \t- rubinius
      \t- jruby
      ASK
      ROOT_FILES = [
        "Gemfile",
        "LICENSE.txt",
        "Thorfile",
        "Procfile",
        "server.rb"
      ]

      attr_reader :command, :name

      def_delegator :@command, :empty_directory
      def_delegator :@command, :directory
      def_delegator :@command, :template
      def_delegator :@command, :inside
      def_delegator :@command, :run
      def_delegator :@command, :ask
      def_delegator :@command, :say

      def initialize(command, name)
        @command = command
        @name = @command.values.name = name
      end

      def call
        empty_directory(name)
        command.destination_root = name
        ROOT_FILES.each(&method(:template))
        template("gitignore", ".gitignore")
        inside("lib") do
          template("example.rb", "#{name}.rb")
          directory("example", "#{name}")
        end
        directory("db")

        @command.values.ruby = ask(RUBIES_ASK, limit_to: RUBIES)
        template("ruby-version", ".ruby-version")
        template("ruby-gemset", ".ruby-gemset")
        empty_directories("script", "log", "tmp", "doc")
        run("git init")
        say("You should now run: bundle install")
      end

      private

      def empty_directories(*directories)
        directories.each { |directory| empty_directory directory }
      end
    end
  end
end
