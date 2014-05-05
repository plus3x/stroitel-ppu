require 'test_helper'

class TypeOfProductTest < ActiveSupport::TestCase
  setup do
    @type_of_product = type_of_products(:one)
  end

  should belong_to(:service).touch(true)
  should have_many(:products).dependent(:delete_all)
  should have_one(:seo_meta).dependent(:delete)
  should accept_nested_attributes_for(:seo_meta).allow_destroy(true)

  test 'must have base fields' do
    assert_respond_to @type_of_product, :name
    assert_respond_to @type_of_product, :title
    assert_respond_to @type_of_product, :description
    assert_respond_to @type_of_product, :picture_url
  end
end
