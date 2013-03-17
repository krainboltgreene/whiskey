require "thor"
require "whiskey"


class Whiskey
  class Whiskey < Thor
    desc "start", "Starts a new whiskey project"

    def start
      puts "foo"
    end
  end
end
