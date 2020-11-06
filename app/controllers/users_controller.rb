class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path, notice: "Account created"
    else
      flash.now.alert = "Email or password is invalid"
      render "new"
    end
  end
end

private

def user_params
  params.require(:user).permit(:email, :password)
end
