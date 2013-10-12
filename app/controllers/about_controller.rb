class AboutController < ApplicationController
  def index
    expires_in 10.minutes, public: true
    fresh_when [File.mtime('app/views/about/index.html.erb'), current_user], public: true
    @meta_keywords = 'Трубы Трубень Трубенище Отрубеть'
    @meta_description = 'Три тыщи труб тебе в зад!'
  end
end
