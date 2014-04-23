class AboutController < ApplicationController
  # GET /about
  def index
    fresh_when [File.mtime('app/views/about/index.html.slim'), current_user], public: true
  end
end