require 'test_helper'

class DebtorsControllerTest < ActionController::TestCase
  setup do
    @debtor = debtors(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:debtors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create debtor" do
    assert_difference('Debtor.count') do
      post :create, debtor: { content: @debtor.content, title: @debtor.title }
    end

    assert_redirected_to debtor_path(assigns(:debtor))
  end

  test "should show debtor" do
    get :show, id: @debtor
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @debtor
    assert_response :success
  end

  test "should update debtor" do
    patch :update, id: @debtor, debtor: { content: @debtor.content, title: @debtor.title }
    assert_redirected_to debtor_path(assigns(:debtor))
  end

  test "should destroy debtor" do
    assert_difference('Debtor.count', -1) do
      delete :destroy, id: @debtor
    end

    assert_redirected_to debtors_path
  end
end
