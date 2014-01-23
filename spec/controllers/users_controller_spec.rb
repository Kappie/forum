require 'spec_helper'

describe UsersController do
  describe "POST #create" do
    context "with valid attributes" do
      it "persists user" do
        expect { post :create, user: attributes_for(:user) }.to change(User, :count).by(1)
      end

      it "redirects to user's profile page" do
        post :create, user: attributes_for(:user)
        expect(response).to redirect_to(User.last)
      end
    end

    context "with invalid attributes" do
      it "does not persist user" do
        expect do
          post :create, user: {name: "", password: "", password_confirmation: ""}
        end.to_not change(User, :count)
      end

      it "renders new" do
        post :create, user: {name: "", password: "", password_confirmation: ""}
        expect(response).to render_template(:new)
      end
    end
  end
end
