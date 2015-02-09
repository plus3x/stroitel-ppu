describe TypeOfProductsController do
  specify { expect(get:    '/services/1/type_of_products/1/products'       ).to route_to('products#index', type_of_product_id: '1', service_id: '1') }
  specify { expect(get:    '/services/1/type_of_products/1/products/new'   ).to route_to('products#new', type_of_product_id: '1', service_id: '1') }
  specify { expect(post:   '/services/1/type_of_products/1/products  '     ).to route_to('products#create', type_of_product_id: '1', service_id: '1') }
  specify { expect(get:    '/services/1/type_of_products/1/products/1'     ).to route_to('products#show', type_of_product_id: '1', service_id: '1', id: '1') }
  specify { expect(get:    '/services/1/type_of_products/1/products/1/edit').to route_to('products#edit', type_of_product_id: '1', service_id: '1', id: '1') }
  specify { expect(patch:  '/services/1/type_of_products/1/products/1'     ).to route_to('products#update', type_of_product_id: '1', service_id: '1', id: '1') }
  specify { expect(delete: '/services/1/type_of_products/1/products/1'     ).to route_to('products#destroy', type_of_product_id: '1', service_id: '1', id: '1') }
end
