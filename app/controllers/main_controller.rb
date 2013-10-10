class MainController < ApplicationController
  def index
    @services = Service.all
    fresh_when @services
    @meta_keywords = 'Трубы Трубень Трубенище Отрубеть'
    @meta_description = 'Три тыщи труб тебе в зад!'
  end
end
