require "spec_helper"

describe Whiskey::Server::Cycle do
  let(:cycle) { described_class.new(%|{"key": "value"}|) }

  describe "#interpret!" do
    let(:interpret!) { cycle.interpret! }

    before(:each) do
      allow(cycle).to receive(:input) do
        {}
      end
    end

    it "should return the response" do
      expect(interpret!).to be_a(Whiskey::Server::Interpretor)
    end
  end

  describe "#input" do
    it "returns the deserialized reception"
    it "sets the response to an error if the receiver isn't valid"
  end

  describe "#output" do
    it "returns a json body"
  end
end
