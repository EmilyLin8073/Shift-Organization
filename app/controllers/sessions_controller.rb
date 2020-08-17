class SessionsController < ApplicationController

  def new

  end

  def create
    user = User.where(email: params[:session][:email].downcase).first

    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:notice] = "Logged in as " + user.name
      redirect_to user

    else
      flash.now[:notice] = "User name or password is wrong"
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "Logged out"
    redirect_to login_path
  end
end
