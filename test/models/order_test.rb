require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  setup do
    @order = orders(:one)
  end

  test 'must have base fields' do
    assert_respond_to @order, :email
    assert_respond_to @order, :description
  end
end
