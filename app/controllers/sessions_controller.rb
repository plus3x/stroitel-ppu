class SessionsController < ApplicationController
  skip_before_action :set_public_proxy_refresh

  # GET /login
  def new
  end

  # POST /login
  def create
    if sessions_is_authenticated?
      redirect_to main_url
    else
      redirect_to login_url, alert: 'Invalid user/password combination'
    end
  end

  # DELETE /logout
  def destroy
    session[:user_id] = nil
    redirect_to main_url, notice: 'Logged out'
  end

  private

  def sessions_is_authenticated?
    user = User.find_by(name: params[:name])
    return false unless user and user.authenticate(params[:password])
    session[:user_id] = user.id
  end
end
