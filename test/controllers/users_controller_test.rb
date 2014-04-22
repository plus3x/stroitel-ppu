require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    login_as :admin
    @user = users(:manager)
  end

  test 'should route to users' do
    assert_routing '/users', { action: 'index', controller: 'users' }
  end

  test 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end

  test 'should route to new user' do
    assert_routing '/users/new', { action: 'new', controller: 'users' }
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should create user' do
    assert_difference 'User.count' do
      post :create, user: { name: @user.name, password: 'secret', password_confirmation: 'secret' }
    end
    assert_redirected_to user_path(assigns(:user))
  end

  test 'should route to show user' do
    assert_routing '/users/1', { action: 'show', controller: 'users', id: '1' }
  end

  test 'should show user' do
    get :show, id: @user
    assert_response :success
  end

  test 'should route to edit user' do
    assert_routing '/users/1/edit', { action: 'edit', controller: 'users', id: '1' }
  end

  test 'should get edit' do
    get :edit, id: @user
    assert_response :success
  end

  test 'should update user' do
    patch :update, id: @user, user: { name: @user.name, password: 'secret', password_confirmation: 'secret' }
    assert_redirected_to user_path(assigns(:user))
  end

  test 'should destroy user' do
    assert_difference 'User.count', -1 do
      delete :destroy, id: @user
    end
    assert_redirected_to users_path
  end
end
