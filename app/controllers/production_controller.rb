class ProductionController < ApplicationController
  def index
    expires_in 10.minutes, public: true
    fresh_when File.mtime('app/views/production/index.html.erb'), public: true
    @meta_keywords = 'Трубы Трубень Трубенище Отрубеть'
    @meta_description = 'Три тыщи труб тебе в зад!'
  end
end
