class ApplicationController < ActionController::Base
  include ApplicationHelper
  before_action :authorize
  before_action :set_public_proxy_refresh, only: [:show, :index]
  before_action :select_debtors
  
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
    
    def select_debtors
      @debtor = Debtor.first
    end
end
