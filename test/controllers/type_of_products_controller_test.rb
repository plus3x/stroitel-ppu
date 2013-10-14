require 'test_helper'

class TypeOfProductsControllerTest < ActionController::TestCase
  setup do
    @service = services(:one)
    @type_of_product = type_of_products(:one)
    @seo_meta = seo_meta(:one)
  end

  test "should get index" do
    login_as :manager
    get :index, service_id: @service
    assert_response :success
    assert_not_nil assigns(:type_of_products)
  end

  test "should get new" do
    login_as :manager
    get :new, service_id: @service
    assert_response :success
  end

  test "should create type_of_product" do
    login_as :manager
    assert_difference 'TypeOfProduct.count' do
      post :create, 
        type_of_product: {
          description: @type_of_product.description,
          name:        @type_of_product.name,
          picture_url: @type_of_product.picture_url,
          title:       @type_of_product.title,
          seo_meta:    @seo_meta
        },
        service_id: @service
    end

    assert_redirected_to [@service, assigns(:type_of_product)]
  end

  test "should show type_of_product" do
    get :show, id: @type_of_product, service_id: @service
    assert_response :success
  end

  test "should get edit" do
    login_as :manager
    get :edit, id: @type_of_product, service_id: @service
    assert_response :success
  end

  test "should update type_of_product" do
    login_as :manager
    patch :update, 
      id: @type_of_product, 
      type_of_product: {
        description: @type_of_product.description,
        name:        @type_of_product.name,
        picture_url: @type_of_product.picture_url,
        title:       @type_of_product.title,
        seo_meta:    @seo_meta
      },
      service_id: @service
    assert_redirected_to [@service, assigns(:type_of_product)]
  end

  test "should destroy type_of_product" do
    login_as :manager
    assert_difference 'TypeOfProduct.count', -1 do
      delete :destroy, id: @type_of_product, service_id: @service
    end

    assert_redirected_to service_url
  end
end
