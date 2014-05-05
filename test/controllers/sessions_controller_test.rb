require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  test 'should route to new session' do
    assert_routing '/login', { action: 'new', controller: 'sessions' }
  end

  test 'should get new' do
    get :new
    assert_response :success
  end
  
  test 'should login' do
    manager = users(:manager)
    post :create, name: manager.name, password: 'manager'
    assert_redirected_to main_url
    assert_equal manager.id, session[:user_id]
  end
  
  test 'should fail login' do
    manager = users(:manager)
    post :create, name: manager.name, password: 'wrong'
    assert_redirected_to login_url
  end
  
  test 'should logout' do
    delete :destroy
    assert_redirected_to main_url
  end
end
