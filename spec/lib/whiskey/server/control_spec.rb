require "spec_helper"

module ExampleControl
  include Whiskey::Server::Control
end

describe Whiskey::Server::Control do
  include_context "stubbed logging"

  let(:control) { ExampleControl }

  describe ".controls" do
    it "returns all the controls"
  end

  describe ".to_resources" do

  end

  describe ".to_resource" do

  end

  describe ".actions" do

  end
end
