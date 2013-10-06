require 'test_helper'

class OrdersControllerTest < ActionController::TestCase
  setup do
    @order = orders(:one)
  end

  test "should get index" do
    login_as :manager
    get :index
    assert_response :success
    assert_not_nil assigns(:orders)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create order" do
    assert_difference 'Order.count' do
      post :create, order: { description: @order.description, email: @order.email }
    end

    assert_redirected_to order_path(assigns(:order))
  end

  test "should show order" do
    login_as :manager
    get :show, id: @order
    assert_response :success
  end

  test "should get edit" do
    login_as :manager
    get :edit, id: @order
    assert_response :success
  end

  test "should update order" do
    login_as :manager
    patch :update, id: @order, order: { description: @order.description, email: @order.email }
    assert_redirected_to order_path(assigns(:order))
  end

  test "should destroy order" do
    login_as :manager
    assert_difference 'Order.count', -1 do
      delete :destroy, id: @order
    end

    assert_redirected_to orders_path
  end

  test "invoice after create new order" do
    email = "client@mail.com"
    assert_difference 'UserNotifier.deliveries.count' do
      assert_difference 'Order.count' do
        post :create, order: { email: email, description: @order.description }
      end
    end
    mail = UserNotifier.deliveries.last
    assert_equal I18n.t('user_notifier.invoice.subject'), mail.subject
    assert_equal [email], mail.to
  end
end
