class SeoMeta < ActiveRecord::Base
  belongs_to :service
  belongs_to :type_of_product
  belongs_to :product
end