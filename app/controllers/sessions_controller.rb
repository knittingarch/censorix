class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user&.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:notice] = "Log in successful"
      redirect_to root_path
    else
      flash[:notice] = "Email or password is invalid"
      redirect_to "/login"
    end
  end

  def destroy
    session[:user_id] = nil

    redirect_to root_path, notice: "Logged out"
  end
end
