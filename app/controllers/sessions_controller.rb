class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user&.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to root_path, notice: "Log in successful"
    else
      redirect_to "/login"
    end
  end

  def destroy
    session[:user_id] = nil

    redirect_to root_path, notice: "Logged out"
  end
end
