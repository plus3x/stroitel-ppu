module ApplicationHelper
  def current_user
    return Role::Guest.new unless session[:user_id]
    @_current_user ||= User.find(session[:user_id])
  end
end