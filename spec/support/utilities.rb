module Utilities
  def login_as(user)
    session[:user_id] = user.id
  end
end