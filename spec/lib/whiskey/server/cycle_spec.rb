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
    let(:receiver) { double("Whiskey::Server::Receiver") }

    before(:each) do
      allow(cycle).to receive(:receiver).and_return(receiver)
    end

    context "with valid receiver" do
      it "returns the deserialized receiver" do
        allow(receiver).to receive(:valid?).and_return(true)
        expect(receiver).to receive(:deserialize)
        cycle.input
      end
    end

    context "with invalid receiver" do
      let(:response) { cycle.instance_variable_get(:@response) }
      let(:bad_request) { Whiskey::Server::Error.new(:bad_request).to_hash }

      it "sets the response to an error" do
        allow(receiver).to receive(:valid?).and_return(false)
        cycle.input
        expect(response).to eq(bad_request)
      end
    end
  end

  describe "#output" do
    it "returns a json body"
  end
end
