require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  test 'should get main' do
    get :main
    assert_not_nil assigns(:services)
    assert_response :success
  end

  test 'should get about' do
    get :about
    assert_response :success
  end

  test 'should get contacts' do
    get :contacts
    assert_response :success
  end

  test 'should get production' do
    get :production
    assert_response :success
  end
end
