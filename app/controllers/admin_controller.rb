class AdminController < ApplicationController
  before_action :authorize

  def index
    expires_in 10.minutes, public: true
    fresh_when File.mtime('app/views/admin/index.html.erb'), public: true
  end
end
