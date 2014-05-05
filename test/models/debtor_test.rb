require 'test_helper'

class DebtorTest < ActiveSupport::TestCase
  setup do
    @debtor = debtors(:one)
  end

  test 'must have base fields' do
    assert_respond_to @debtor, :title
    assert_respond_to @debtor, :content
  end
end