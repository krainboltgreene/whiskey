require "spec_helper"

describe Whiskey::Server::Deserializer do
  let(:deserializer) { described_class.new(data) }

  describe "#valid?" do
    let(:valid?) { deserializer.valid? }

    context "when given a valid JSON document" do
      let(:data) { %|{ "key": "value" }| }

      it "returns true" do
        expect(valid?).to be(true)
      end
    end

    context "when given an invalid JSON document" do
      let(:data) { %|{ "key" "value" }| }

      it "returns false" do
        expect(valid?).to be(false)
      end
    end
  end
end
