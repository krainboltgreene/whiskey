require "codeclimate-test-reporter"
CodeClimate::TestReporter.start

require "pry"
require "rspec"
require "whiskey"
require "whiskey/server"
require "whiskey/command"

shared_context "stubbed logging" do
  before(:each) do
    logger = double("Logger")
    allow(logger).to receive(:info)
    allow(logger).to receive(:debug)
    allow(logger).to receive(:error)
    allow(Whiskey).to receive(:logger).and_return(logger)
  end
end
