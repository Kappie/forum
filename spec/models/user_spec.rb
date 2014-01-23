require 'spec_helper'

describe User do
  it "persists valid users" do
    expect( create(:user) ).to be_valid
  end

  it "is invalid if name has wrong format" do
    expect( build(:user, name: " // ") ).not_to be_valid
    expect( build(:user, name: "") ).not_to be_valid
    expect( build(:user, name: "     ") ).not_to be_valid
    expect( build(:user, name: "aaa") ).not_to be_valid
    expect( build(:user, name: "aaa" * 10) ).not_to be_valid
  end

  it "is invalid if name already in use" do
    create(:user)
    expect( build(:user) ).not_to be_valid
  end

  it "is invalid if password has wrong format" do
    expect( build(:user, password: "", password_confirmation: "") ).not_to be_valid
    expect( build(:user, password: "   ", password_confirmation: "   ") ).not_to be_valid
  end

  it "is invalid if password and confirmation don't match" do
    expect( build(:user, password: "mismatch") ).not_to be_valid    
  end

  it "authenticates with correct password" do
    user = create(:user, password: "my_password", password_confirmation: "my_password")
    expect( user.authenticate("my_password") ).to eq user 
  end

  it "does not authenticate with incorrect password" do
    user = create(:user, password: "my_password", password_confirmation: "my_password")
    expect( user.authenticate("fails") ).to eq false
  end
end