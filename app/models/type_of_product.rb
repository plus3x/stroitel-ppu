class TypeOfProduct < ActiveRecord::Base
  has_many :products
  belongs_to :service
end