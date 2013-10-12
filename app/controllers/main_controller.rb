class MainController < ApplicationController
  def index
    @services = Service.all
    fresh_when [@services, current_user], public: true
    expires_in 10.minutes, public: true
    @meta_keywords = 'Трубы Трубень Трубенище Отрубеть'
    @meta_description = 'Три тыщи труб тебе в зад!'
  end
end
