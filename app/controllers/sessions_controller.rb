class SessionsController < ApplicationController

  def new

  end

  def create
    user = User.where(email: params[:session][:email].downcase).first

    if user && user.authenticate(params[:session][:password])
      flash[:notice] = "Logged in successfully"
      redirect_to user

    else
      flash.now[:danger] = "User name or password is wrong"
      render 'new'
    end
  end

  def destroy

  end
end
