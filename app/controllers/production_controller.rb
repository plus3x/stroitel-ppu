class ProductionController < ApplicationController
  # GET /productions
  def index
    fresh_when [File.mtime('app/views/production/index.html.slim'), current_user], public: true
  end
end
