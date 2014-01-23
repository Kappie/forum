class SessionsController < ApplicationController
  def create
    user = User.find_by(name: params[:session][:name])
    if user && entered_correct_password?(user)
      sign_in(user)
      redirect_to user
    else
      flash.now[:error] = "Invalid user/password combination."
      render :new
    end
  end

  def destroy
    sign_out
    redirect_to root_path, notice: "Signed out successfully."
  end

  private

  def entered_correct_password?(user)
    user.authenticate(params[:session][:password])
  end
end
