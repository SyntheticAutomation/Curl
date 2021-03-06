class UsersController < ApplicationController

  def create
    new_username = user_params[:username]
    new_password = user_params[:password]
    password_confirmation = user_params[:confirm_password]

    if valid_request?(new_username, new_password, password_confirmation)
      @user = User.create(username: new_username, password: new_password)
      flash[:notice] = "Registration successful!"
      session[:user_id] = @user.id
      redirect_to root_path
    else
      flash[:notice] = "Error: username already exists" if unique_username?(new_username) == false
      flash[:notice] = "Error: password must be more than 7 characters" if secure_password?(new_password) == false
      flash[:notice] = "Error: password fields do not match" if password_fields_match?(new_password, password_confirmation) == false
      redirect_to root_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :confirm_password)
  end

  def secure_password?(password)
    password.length > 7
  end

  def unique_username?(name)
    !User.find_by(username: name)
  end

  def password_fields_match?(pass1, pass2)
    pass1 == pass2
  end

  def valid_request?(name, pass1, pass2)
    secure_password?(pass1) && unique_username?(name) && password_fields_match?(pass1, pass2)
  end
end