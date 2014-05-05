require 'test_helper'

class ServiceTest < ActiveSupport::TestCase
  setup do
    @service = services(:one)
  end

  should have_many(:type_of_products).dependent(:delete_all)
  should have_one(:seo_meta).dependent(:delete)
  should accept_nested_attributes_for(:seo_meta).allow_destroy(true)

  test 'must have base fields' do
    assert_respond_to @service, :name
    assert_respond_to @service, :title
    assert_respond_to @service, :description
    assert_respond_to @service, :picture_url
  end
end