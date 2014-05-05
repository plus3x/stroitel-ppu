require 'test_helper'

class ProductsControllerTest < ActionController::TestCase
  setup do
    @product = products(:one)
    @service = services(:one)
    @type_of_product = type_of_products(:one)
    @seo_meta = seo_meta(:one)
  end

  test 'should route to products' do
    assert_routing '/services/1/type_of_products/1/products', { action: 'index', controller: 'products',
                                                                service_id: '1', type_of_product_id: '1' }
  end

  test 'should get index' do
    get :index, service_id: @service, type_of_product_id: @type_of_product
    assert_response :success
    assert_not_nil assigns(:products)
  end

  test 'should route to new product' do
    assert_routing '/services/1/type_of_products/1/products/new', { action: 'new', controller: 'products',
                                                                    service_id: '1', type_of_product_id: '1' }
  end

  test 'should get new' do
    login_as :manager
    get :new, service_id: @service, type_of_product_id: @type_of_product
    assert_response :success
  end

  test 'should create product' do
    login_as :manager
    assert_difference 'Product.count' do
      post :create, 
        product: { 
          description: @product.description, 
          name:        @product.name, 
          picture_url: @product.picture_url, 
          title:       @product.title,
          seo_meta:    @seo_meta
        },
        service_id: @service, type_of_product_id: @type_of_product
    end
    assert_redirected_to [@service, @type_of_product, assigns(:product)]
  end

  test 'should route to show product' do
    assert_routing '/services/1/type_of_products/1/products/1', { action: 'show', controller: 'products', id: '1',
                                                                  service_id: '1', type_of_product_id: '1' }
  end

  test 'should show product' do
    get :show, id: @product, service_id: @service, type_of_product_id: @type_of_product
    assert_response :success
  end

  test 'should route to edit product' do
    assert_routing '/services/1/type_of_products/1/products/1/edit', { action: 'edit', controller: 'products', id: '1',
                                                                       service_id: '1', type_of_product_id: '1' }
  end

  test 'should get edit' do
    login_as :manager
    get :edit, id: @product, service_id: @service, type_of_product_id: @type_of_product
    assert_response :success
  end

  test 'should update product' do
    login_as :manager
    patch :update, 
      id: @product, 
      product: {
        description: @product.description,
        name:        @product.name,
        picture_url: @product.picture_url,
        title:       @product.title,
        seo_meta:    @seo_meta
      },
      service_id: @service, type_of_product_id: @type_of_product
    assert_redirected_to [@service, @type_of_product, assigns(:product)]
  end

  test 'should destroy product' do
    login_as :manager
    assert_difference 'Product.count', -1 do
      delete :destroy, 
        id: @product,
        service_id: @service, type_of_product_id: @type_of_product
    end

    assert_redirected_to service_type_of_products_url
  end
end
