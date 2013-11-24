require "logger"
require "astruct"
require "active_support/core_ext"

module Whiskey
  require_relative "whiskey/version"

  def self.logger
    @logger ||= Logger.new(STDOUT).tap do |log|
      log.level = ENV["WHISKEY_ENVIRONMENT"] == "development" ? Logger::DEBUG : Logger::INFO
      log.formatter = nil
    end
  end
end

