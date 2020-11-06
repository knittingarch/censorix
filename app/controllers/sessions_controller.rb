class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user&.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:notice] = t("auth.successful_login")
      redirect_to root_path
    else
      flash[:notice] = t("auth.error")
      redirect_to "/login"
    end
  end

  def destroy
    session[:user_id] = nil

    flash[:notice] = t("auth.logged_out")
    redirect_to root_path
  end
end
