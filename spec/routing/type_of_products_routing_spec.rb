describe TypeOfProductsController do
  specify { expect(get:    '/services/1/type_of_products'       ).to route_to('type_of_products#index', service_id: '1') }
  specify { expect(get:    '/services/1/type_of_products/new'   ).to route_to('type_of_products#new', service_id: '1') }
  specify { expect(post:   '/services/1/type_of_products  '     ).to route_to('type_of_products#create', service_id: '1') }
  specify { expect(get:    '/services/1/type_of_products/1'     ).to route_to('type_of_products#show', service_id: '1', id: '1') }
  specify { expect(get:    '/services/1/type_of_products/1/edit').to route_to('type_of_products#edit', service_id: '1', id: '1') }
  specify { expect(patch:  '/services/1/type_of_products/1'     ).to route_to('type_of_products#update', service_id: '1', id: '1') }
  specify { expect(delete: '/services/1/type_of_products/1'     ).to route_to('type_of_products#destroy', service_id: '1', id: '1') }
end
