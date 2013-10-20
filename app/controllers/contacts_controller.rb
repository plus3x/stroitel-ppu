class ContactsController < ApplicationController
  def index
    @head_title = 'ПСФ Строитель / Контакты'
    @meta_keywords = 'Contacts Трубы Трубень Трубенище Отрубеть'
    @meta_description = 'Три тыщи труб тебе в зад!'
    fresh_when [File.mtime('app/views/contacts/index.html.erb'), current_user], public: true
  end
end
