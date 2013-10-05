class User < ActiveRecord::Base
  belongs_to :role
  has_secure_password

  validates_presence_of :name
  validates_uniqueness_of :name
  
  def admin?
    role.title == 'admin'
  end
  
  def manager?
    role.title == 'manager'
  end
  
  def can?(controller, action)
    role.permit?(controller, action)
  end
  
end
