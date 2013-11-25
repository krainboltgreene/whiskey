require "spec_helper"

describe Whiskey::Server::Action::Verb do
  let(:verb) { described_class.new(action) }

  describe "#name" do
    let(:name) { verb.name }

    context "when action is List" do
      let(:action) { stub_const("List", Class.new) }

      it "returns PULL" do
        expect(name).to eq("PULL")
      end
    end

    context "when action is Show" do
      let(:action) { stub_const("Show", Class.new) }

      it "returns PULL" do
        expect(name).to eq("PULL")
      end
    end

    context "when action is Create" do
      let(:action) { stub_const("Create", Class.new) }

      it "returns PUSH" do
        expect(name).to eq("PUSH")
      end
    end

    context "when action is Update" do
      let(:action) { stub_const("Update", Class.new) }

      it "returns PUSH" do
        expect(name).to eq("PUSH")
      end
    end
  end

  describe "#to_hash" do

  end

  describe "#command" do

  end
end
