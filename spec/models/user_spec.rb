require 'spec_helper'

describe User do
  it "persists valid users" do
    expect( create(:user) ).to be_valid
  end

  it "is invalid without name" do
    expect( build(:user, name: "") ).not_to be_valid
  end

  it "is invalid if name already in use" do
    create(:user)
    expect( build(:user) ).not_to be_valid
  end
end
