require "spec_helper"

describe Whiskey::Server::Handler do
  include_context "stubbed logging"

  let(:connection) { double("Whiskey::Server::Connection") }
  let(:handler) { described_class.new(connection) }

  before(:each) do
    allow(connection).to receive(:process)
  end

  describe "#process" do
    before(:each) do
      allow(handler).to receive(:loop) do |&block|
        instance_eval(&block)
      end
    end

    it "continually processes connections" do
      expect(connection).to receive(:process)
    end

    after(:each) do
      handler.process
    end
  end
end
