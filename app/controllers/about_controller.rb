class AboutController < ApplicationController
  def index
    @head_title = 'ПСФ Строитель / О компании'
    @meta_keywords = 'About Трубы Трубень Трубенище Отрубеть'
    @meta_description = 'Три тыщи труб тебе в зад!'
    expires_in 5.minutes, public: true
    fresh_when [File.mtime('app/views/about/index.html.erb'), current_user], public: true
  end
end