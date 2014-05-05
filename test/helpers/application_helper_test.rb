require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase
  test 'should return new user if session has not user id' do
    session[:user_id] = nil
    assert_not_nil current_user
    assert current_user.new_record?, 'Should return new record'
    assert_kind_of User, current_user
  end

  test 'should return cached @current_user' do
    @_current_user = User.first
    session[:user_id] = @_current_user.id
    assert_equal current_user, User.first
  end
  
  test 'should return user from DB if @current_user is not cached' do
    @_current_user = nil
    session[:user_id] = User.first.id
    assert_equal current_user, User.first
  end

  test '@current_user should be cached after first call' do
    @_current_user = nil
    session[:user_id] = User.first.id
    current_user
    assert_equal @_current_user, User.first
  end
end