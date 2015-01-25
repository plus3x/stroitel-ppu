class ApplicationController < ActionController::Base
  include ApplicationHelper
  before_action :authorize
  before_action :set_public_proxy_refresh, only: [:show, :index]
  before_action :set_public_fresh_when,    only: [:index, :show]

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected

  def authorize
    unless current_user.can?(params[:action], params[:controller])
      redirect_to main_url, notice: 'You no have permissions to do this.'
    end
  end

  def set_public_proxy_refresh
    expires_now if stale? current_user.to_s
    expires_in 4.hours, public: true
  end

  def set_public_fresh_when
    case params[:action]
    when 'index' then fresh_when [requested_model.all, current_user],               public: true
    when 'show'  then fresh_when [requested_model.find(params[:id]), current_user], public: true
    end
  end

  def requested_model
    params[:controller].classify.constantize
  end
end
