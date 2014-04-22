class User < ActiveRecord::Base
  self.inheritance_column = 'role'
  def self.model_name
    ActiveModel::Name.new(User)
  end

  enum role: {
    admin:   'Role::Admin',
    manager: 'Role::Manager',
    guest:   'Role::Guest'
  }

  has_secure_password

  validates_presence_of :name, :role

  private

    def can_do?(args={})
      not (args[:controllers] & [@controller.to_sym]).empty? and
      (not (   args[:actions] & [@action.to_sym]    ).empty? rescue true)
    end
end