class TypeOfProduct < ActiveRecord::Base
  has_many :products, dependent: :delete_all
  belongs_to :service, touch: true
  has_one :seo_meta, dependent: :delete
end