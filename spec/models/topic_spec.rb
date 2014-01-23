require 'spec_helper'

describe Topic do
  it "persists valid topics" do
    expect( create(:topic) ).to be_valid
  end

  it "is invalid without title" do
    expect( build(:topic, title: "") ).to_not be_valid
  end

  it "is invalid without body" do
    expect( build(:topic, body: "") ).to_not be_valid
  end
end
