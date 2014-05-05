require 'test_helper'

class ServicesControllerTest < ActionController::TestCase
  setup do
    @service = services(:one)
    @seo_meta = seo_meta(:one)
  end

  test 'should route to services' do
    assert_routing '/services', { action: 'index', controller: 'services' }
  end

  test 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:services)
  end

  test 'should route to new service' do
    assert_routing '/services/new', { action: 'new', controller: 'services' }
  end

  test 'should get new' do
    login_as :manager
    get :new
    assert_response :success
  end

  test 'should create service' do
    login_as :manager
    assert_difference 'Service.count' do
      post :create,
        service: {
          description: @service.description,
          name:        @service.name,
          picture_url: @service.picture_url,
          title:       @service.title,
          seo_meta:    @seo_meta
        }
    end

    assert_redirected_to service_path(assigns(:service))
  end

  test 'should route to show service' do
    assert_routing '/services/1', { action: 'show', controller: 'services', id: '1' }
  end

  test 'should show service' do
    get :show, id: @service
    assert_response :success
  end

  test 'should route to edit service' do
    assert_routing '/services/1/edit', { action: 'edit', controller: 'services', id: '1' }
  end

  test 'should get edit' do
    login_as :manager
    get :edit, id: @service
    assert_response :success
  end

  test 'should update service' do
    login_as :manager
    patch :update, id: @service,
        service: {
          description: @service.description,
          name:        @service.name,
          picture_url: @service.picture_url,
          title:       @service.title,
          seo_meta:    @seo_meta
        }
    assert_redirected_to service_path(assigns(:service))
  end

  test 'should destroy service' do
    login_as :manager
    assert_difference 'Service.count', -1 do
      delete :destroy, id: @service
    end

    assert_redirected_to services_path
  end
end
