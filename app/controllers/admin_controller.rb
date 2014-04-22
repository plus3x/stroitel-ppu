class AdminController < ApplicationController
  skip_before_action :set_public_proxy_refresh

  # GET /admin
  def index
    fresh_when [File.mtime('app/views/admin/index.html.slim'), current_user]
  end
end
