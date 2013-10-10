class Service < ActiveRecord::Base
  has_many :type_of_products, dependent: :delete_all
  has_one :seo_meta, dependent: :delete
end