class Admin::SessionsController < ApplicationController

  def new
  end

  def create
    @admin = Admin.find_by_username( params[:username] )
    if @admin.present?
      if @admin.password == params[:password]
        session[:admin_id] = @admin.id
        redirect_to admin_cards_path
      else
        flash[:alert] = 'Wrong password'
        redirect_to new_admin_session_path
      end
    else
      flash[:alert] = 'No admin found with that username'
      redirect_to new_admin_session_path
    end
  end

  def destroy
    flash[:notice] = "#{current_admin.username} has Logged Out"
    session[:admin_id] = nil
    redirect_to root_path
  end

end
