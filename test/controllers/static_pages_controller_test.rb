require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  test 'should route to main static page' do
    assert_routing '/', { action: 'main', controller: 'static_pages' }
  end

  test 'should get main' do
    get :main
    assert_not_nil assigns(:services)
    assert_response :success
  end

  test 'should route to about static page' do
    assert_routing '/about', { action: 'about', controller: 'static_pages' }
  end

  test 'should get about' do
    get :about
    assert_response :success
  end

  test 'should route to contacts static page' do
    assert_routing '/contacts', { action: 'contacts', controller: 'static_pages' }
  end

  test 'should get contacts' do
    get :contacts
    assert_response :success
  end

  test 'should route to production static page' do
    assert_routing '/production', { action: 'production', controller: 'static_pages' }
  end

  test 'should get production' do
    get :production
    assert_response :success
  end
end
