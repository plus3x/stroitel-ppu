require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  setup do
    @product = products(:one)
  end

  should belong_to(:type_of_product).touch(true)
  should have_one(:seo_meta).dependent(:delete)
  should accept_nested_attributes_for(:seo_meta).allow_destroy(true)

  test 'must have base fields' do
    assert_respond_to @product, :name
    assert_respond_to @product, :title
    assert_respond_to @product, :description
    assert_respond_to @product, :picture_url
  end
end
