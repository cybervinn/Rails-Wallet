module ApplicationHelper
  def current_user
    if session[:user_id]
      current_user = User.find(session[:user_id])
    end
  end

  def current_admin
    if session[:admin_id]
      current_admin = Admin.find(session[:admin_id])
    end
  end

end
