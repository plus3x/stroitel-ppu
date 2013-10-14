class ProductionController < ApplicationController
  def index
    @head_title = 'ПСФ Строитель / Продукция'
    @meta_keywords = 'Production Трубы Трубень Трубенище Отрубеть'
    @meta_description = 'Три тыщи труб тебе в зад!'
    expires_in 5.minutes, public: true
    fresh_when [File.mtime('app/views/production/index.html.erb'), current_user], public: true
  end
end
