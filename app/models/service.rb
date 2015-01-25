class Service < ActiveRecord::Base
  include Bootsy::Container

  has_many :type_of_products, dependent: :delete_all
  has_one :seo_meta, dependent: :delete
  accepts_nested_attributes_for :seo_meta, allow_destroy: true
end
