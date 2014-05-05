require 'test_helper'

class SeoMetaTest < ActiveSupport::TestCase
  setup do
    @seo_meta = seo_meta(:one)
  end

  should belong_to :service
  should belong_to :type_of_product
  should belong_to :product

  test 'must have base fields' do
    assert_respond_to @seo_meta, :keywords
    assert_respond_to @seo_meta, :description
  end
end
