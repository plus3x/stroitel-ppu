class MainController < ApplicationController
  def index
    @services = Service.all
    fresh_when [@services, current_user], public: true
    @head_title       = I18n.t('.main.index.head_title')
    @meta_keywords    = I18n.t('.main.index.meta_keywords')
    @meta_description = I18n.t('.main.index.meta_description')
  end
end
