require "spec_helper"

describe Whiskey::Server::Serializer do
  include_context "stubbed logging"

  let(:serializer) { described_class.new(data) }

  describe "#valid?" do
    let(:valid?) { serializer.valid? }

    context "when given a hash-like object" do
      let(:data) { {} }

      it "returns true" do
        expect(valid?).to be(true)
      end
    end

    context "when given an non-hash-like object" do
      let(:data) { "" }

      it "returns false" do
        expect(valid?).to be(false)
      end
    end
  end
end
