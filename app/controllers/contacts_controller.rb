class ContactsController < ApplicationController
  # GET /contacts
  def index
    fresh_when [File.mtime('app/views/contacts/index.html.slim'), current_user], public: true
  end
end
