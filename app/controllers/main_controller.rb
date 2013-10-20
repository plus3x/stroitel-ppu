class MainController < ApplicationController
  def index
    @services = Service.all
    @head_title = 'ПСФ Строитель / Главная'
    @meta_keywords = 'Main Трубы Трубень Трубенище Отрубеть'
    @meta_description = 'Три тыщи труб тебе в зад!'
    fresh_when [@services, current_user], public: true
  end
end
