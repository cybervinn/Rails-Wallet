class SessionsController < ApplicationController

  def new
    session[:user_id] = nil
  end

  def create
    user = User.find_by_email(params[:email])

    if user.password == params[:password]
        session[:user_id] = user.id
        flash[:notice] = "#{current_user.full_name} has logged in"
        redirect_to users_path
    else
      flash[:alert] = "Invalid Credentials"
      redirect_to new_session_path
    end
  end

  def destroy
    flash[:notice] = "#{current_user.full_name} has Logged Out"
    session[:user_id] = nil
    redirect_to root_path
  end

end
