class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def index
    redirect_to new_session_path unless current_user
    @users = User.all
  end

  def create
    @user = User.create user_params
    if @user.valid?
      flash[:notice] = "Thanks for signing up"
      session[:user_id] = @user.id
      redirect_to users_path
    else
      flash[:alert] = "There was a problem."
      render :new
    end
  end

  def show
    @user = User.find params[:id]
  end

  def edit
    @user = User.find params[:id]
  end

  def update

    @user = User.find params[:id]

    p = user_params

    if user_params[:password].blank?
      p.delete(:password)
      p.delete(:password_confirmation)
    end

    @user.update! p

    flash[:notice] = "Successful update"
    redirect_to user_path(@user)
  end

  def destroy
    @user = User.find params[:id]
    @user.destroy!
    session.clear
    flash[:notice] = "Bye."
    redirect_to users_path
  end

  private

  def user_params
    params.require(:user).permit(:fname,
                                 :lname,
                                 :password,
                                 :email,
                                 :phone,
                                 :password_confirmation)
  end


end
