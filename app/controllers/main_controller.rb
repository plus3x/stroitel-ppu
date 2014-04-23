class MainController < ApplicationController
  # GET /
  def index
    @services = Service.all
    fresh_when [@services, current_user], public: true
  end
end
