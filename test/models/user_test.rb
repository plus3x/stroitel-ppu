require 'test_helper'

class UserTest < ActiveSupport::TestCase
  should have_secure_password
  should validate_presence_of :name
  should validate_presence_of :role

  test 'new user must have role guest' do
    user = User.new
    assert_equal user.role, 'guest'
  end

  test 'user admin must have admin role' do
    assert users(:admin).admin?, 'Admin must have admin role'
  end

  test 'user admin can get new services' do
    assert users(:admin).can?('new', 'services'), 'Admin must have permission to new services'
  end

  test 'user manager must have manager role' do
    assert users(:manager).manager?, 'Manager must have manager role'
  end

  test 'user manager can get new services' do
    assert users(:manager).can?('new', 'services'), 'Manager must have permission to new services'
  end

  test 'it should be possible to set role for a new user' do
    alex = User.create name: 'Alex', role: 'Role::Admin'
    assert_equal alex.role, 'admin'
  end
end
