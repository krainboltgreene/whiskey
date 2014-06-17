require "logger"
require "astruct"
require "active_support/core_ext"

module Whiskey
  require_relative "whiskey/version"
  require_relative "whiskey/logger"  

  def self.logger(manager = Logger.default)
    @logger ||= manager.klass.new(manager.io).tap do |log|
      log.level = manager.klass.const_get(manager.level)
      log.formatter = manager.formatter
    end
  end
end

