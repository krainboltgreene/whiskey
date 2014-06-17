module Whiskey
  class Logger
    DEFAULT = "DEBUG"
    DIRECT_ENV_KEY = "WHISKEY_LOG_LEVEL"
    WHISKEY_ENV_KEY = "WHISKEY_ENVIRONMENT"

    def self.default
      new(::Logger, STDOUT, ENV, nil)
    end

    attr_reader :klass
    attr_reader :io
    attr_reader :formatter

    def initialize(klass, io, env, formatter)
      @klass = klass
      @io = io
      @env = env
      @formatter = formatter
    end

    def level
      @env.fetch(WHISKEY_ENV_KEY, @env.fetch(DIRECT_ENV_KEY, DEFAULT))
    end
  end
end
