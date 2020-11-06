class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = t("auth.account_created")
      redirect_to root_path
    else
      flash[:notice] = t("auth.error")
      render "new"
    end
  end
end

private

def user_params
  params.require(:user).permit(:email, :password)
end
