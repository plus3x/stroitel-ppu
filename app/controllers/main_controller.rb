class MainController < ApplicationController
  def index
    @services = Service.all
    expires_in 10.minutes, public: true
    fresh_when @services, public: true
    @meta_keywords = 'Трубы Трубень Трубенище Отрубеть'
    @meta_description = 'Три тыщи труб тебе в зад!'
  end
end
