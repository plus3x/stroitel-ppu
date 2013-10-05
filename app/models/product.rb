class Product < ActiveRecord::Base
  belongs_to :type_of_product, touch: true
end