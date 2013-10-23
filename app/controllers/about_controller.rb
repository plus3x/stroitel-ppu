class AboutController < ApplicationController
  def index
    fresh_when [File.mtime('app/views/about/index.html.erb'), current_user], public: true
    @head_title       = I18n.t('.about.index.head_title')
    @meta_keywords    = I18n.t('.about.index.meta_keywords')
    @meta_description = I18n.t('.about.index.meta_description')
  end
end