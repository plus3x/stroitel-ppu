class StaticPagesController < ApplicationController
  before_action :set_fresh_when, only: %i(about contacts production)

  # GET /
  def main
    @services = Service.all
    fresh_when [@services, current_user], public: true
  end

  # GET /about
  def about() end

  # GET /contacts
  def contacts() end

  # GET /production
  def production() end

  private

  def set_fresh_when
    fresh_when [File.mtime("app/views/static_pages/#{params[:action]}.html.slim"), current_user], public: true
  end
end
