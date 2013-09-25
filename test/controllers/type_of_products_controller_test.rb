require 'test_helper'

class TypeOfProductsControllerTest < ActionController::TestCase
  setup do
    @type_of_product = type_of_products(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:type_of_products)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create type_of_product" do
    assert_difference('TypeOfProduct.count') do
      post :create, type_of_product: { description: @type_of_product.description, name: @type_of_product.name, picture_url: @type_of_product.picture_url, title: @type_of_product.title }
    end

    assert_redirected_to type_of_product_path(assigns(:type_of_product))
  end

  test "should show type_of_product" do
    get :show, id: @type_of_product
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @type_of_product
    assert_response :success
  end

  test "should update type_of_product" do
    patch :update, id: @type_of_product, type_of_product: { description: @type_of_product.description, name: @type_of_product.name, picture_url: @type_of_product.picture_url, title: @type_of_product.title }
    assert_redirected_to type_of_product_path(assigns(:type_of_product))
  end

  test "should destroy type_of_product" do
    assert_difference('TypeOfProduct.count', -1) do
      delete :destroy, id: @type_of_product
    end

    assert_redirected_to type_of_products_path
  end
end
