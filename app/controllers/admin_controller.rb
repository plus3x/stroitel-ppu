class AdminController < ApplicationController
  before_action :authorize

  def index
    fresh_when [File.mtime('app/views/admin/index.html.erb'), current_user]
  end
end
