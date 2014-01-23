require 'spec_helper'

describe Reply do
  it "persists valid replies" do
    expect( create(:reply) ).to be_valid
  end

  it "is invalid without body" do
    expect( build(:reply, body: "") ).to_not be_valid
  end
end
