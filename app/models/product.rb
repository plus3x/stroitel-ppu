class Product < ActiveRecord::Base
  include Bootsy::Container

  belongs_to :type_of_product, touch: true
  has_one :seo_meta, dependent: :delete
  accepts_nested_attributes_for :seo_meta, allow_destroy: true

  validates :name, :title, presence: true
end
