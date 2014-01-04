require "logger"
require "astruct"
require "active_support/core_ext"

module Whiskey
  require_relative "whiskey/version"

  def self.logger
    @logger ||= Logger.new(STDOUT).tap do |log|
      if ENV["WHISKEY_ENVIRONMENT"] == "development"
        log.level = Logger::DEBUG
      else
        log.level = Logger::INFO
      end
      log.formatter = nil
    end
  end
end

