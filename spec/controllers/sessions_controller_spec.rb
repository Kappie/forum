require 'spec_helper'

describe SessionsController do
  describe "POST #create" do
    it "renders new if invalid name and password" do
      params = {session: {name: "idonotexist", password: "bollocks"} }
      post :create, params
      expect(response).to render_template(:new)
    end

    it "redirects to profile page if valid sign in" do
      user = create(:user)
      params = {session: {name: user.name, password: user.password} }
      post :create, params
      expect(response).to redirect_to(user)
    end
  end
end
