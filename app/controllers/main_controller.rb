class MainController < ApplicationController
  def index
    @services = Service.all
    fresh_when @services
  end
end
