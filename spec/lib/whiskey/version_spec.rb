require "spec_helper"

describe Whiskey::VERSION do
  it "should be a string" do
    expect(Whiskey::VERSION).to be_kind_of(String)
  end
end
