require "spec_helper"

describe Whiskey::Server::Cycle do
  let(:cycle) { described_class.new(%|{"key": "value"}|) }

  describe "#interpret!" do
    let(:interpret!) { cycle.interpret! }
    it "should return the response" do
      expect(interpret!).to call(:response)
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
