class Product < ActiveRecord::Base
  belongs_to :type_of_product, touch: true
  has_one :seo_meta, dependent: :delete
end