class ProductionController < ApplicationController
  # GET /productions
  def index
    fresh_when [File.mtime('app/views/production/index.html.slim'), current_user], public: true
    @head_title       = I18n.t('.production.index.head_title')
    @meta_keywords    = I18n.t('.production.index.meta_keywords')
    @meta_description = I18n.t('.production.index.meta_description')
  end
end
