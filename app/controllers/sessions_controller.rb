class SessionsController < ApplicationController

  def new
    if current_user
      flash[:notice] = "You are already logged in!"
    end
    redirect_to root_path
  end
  
  def create
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = "You are now logged in!"
      redirect_to root_path
    else
      flash[:notice] = "Your credentials were incorrect. Please try again"
      redirect_to root_path
    end
  end

  def destroy
    session.clear
    flash[:notice] = "You are logged out!"
    redirect_to root_path
  end


end
