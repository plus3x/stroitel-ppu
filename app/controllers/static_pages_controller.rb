class StaticPagesController < ApplicationController
  # GET /
  def main
    @services = Service.all
    fresh_when [@services, current_user], public: true
  end

  # GET /about
  def about
    fresh_when [File.mtime('app/views/static_pages/about.html.slim'), current_user], public: true
  end

  # GET /contacts
  def contacts
    fresh_when [File.mtime('app/views/static_pages/contacts.html.slim'), current_user], public: true
  end

  # GET /production
  def production
    fresh_when [File.mtime('app/views/static_pages/production.html.slim'), current_user], public: true
  end
end
