require 'test_helper'

class DebtorsControllerTest < ActionController::TestCase
  setup do
    @debtor = debtors(:one)
  end

  test 'should route to debtors' do
    assert_routing '/debtors', { action: 'index', controller: 'debtors' }
  end

  test 'should get index' do
    login_as :admin
    get :index
    assert_response :success
    assert_not_nil assigns(:debtors)
  end

  test 'should route to new debtor' do
    assert_routing '/debtors/new', { action: 'new', controller: 'debtors' }
  end

  test 'should get new' do
    login_as :admin
    get :new
    assert_response :success
  end

  test 'should create debtor' do
    login_as :admin
    assert_difference 'Debtor.count' do
      post :create, debtor: { content: @debtor.content, title: @debtor.title }
    end

    assert_redirected_to debtor_path(assigns(:debtor))
  end

  test 'should route to show debtor' do
    assert_routing '/debtors/1', { action: 'show', controller: 'debtors', id: '1' }
  end

  test 'should show debtor' do
    get :show, id: @debtor
    assert_response :success
  end

  test 'should route to edit debtor' do
    assert_routing '/debtors/1/edit', { action: 'edit', controller: 'debtors', id: '1' }
  end

  test 'should get edit' do
    login_as :admin
    get :edit, id: @debtor
    assert_response :success
  end

  test 'should update debtor' do
    login_as :admin
    patch :update, id: @debtor, debtor: { content: @debtor.content, title: @debtor.title }
    assert_redirected_to debtor_path(assigns(:debtor))
  end

  test 'should destroy debtor' do
    login_as :admin
    assert_difference 'Debtor.count', -1 do
      delete :destroy, id: @debtor
    end

    assert_redirected_to debtors_path
  end
end
