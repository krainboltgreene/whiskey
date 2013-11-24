require "spec_helper"

describe Whiskey::Server::Cycle do
  include_context "stubbed logging"

  let(:data) { %|{"key": "value"}| }
  let(:cycle) { described_class.new(data) }

  describe "#interpret!" do
    let(:body) do
      {
        "resource" => "accounts",
        "verb" => "PULL",
        "parameters" => { "id" => 1}
      }
    end

    let(:interpret!) { cycle.interpret! }

    before(:each) do
      allow(cycle).to receive(:input).and_return(body)
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
