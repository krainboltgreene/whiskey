require "codeclimate-test-reporter"
CodeClimate::TestReporter.start

require "pry"
require "rspec"
require "whiskey"
require "whiskey/server"
require "whiskey/command"

shared_context "stubbed logging" do
  let(:logger) { double("Logger") }

  before(:each) do
    allow(logger).to receive(:info)
    allow(logger).to receive(:debug)
    allow(logger).to receive(:error)

    allow(Whiskey).to receive(:logger).and_return(logger)
  end
end

shared_context "stubbed configuration" do
  let(:configuration) { double("Whiskey::Configuration") }
  let(:namespace) { "Foo" }

  before(:each) do
    allow(configuration).to receive(:namespace).and_return(namespace)
    allow(Whiskey::Server).to receive(:configuration).and_return(configuration)
  end
end
