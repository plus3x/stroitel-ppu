describe OrdersController do
  specify { expect(get:    '/orders'       ).to route_to('orders#index') }
  specify { expect(get:    '/orders/new'   ).to route_to('orders#new') }
  specify { expect(post:   '/orders  '     ).to route_to('orders#create') }
  specify { expect(get:    '/orders/1'     ).to route_to('orders#show', id: '1') }
  specify { expect(get:    '/orders/1/edit').to route_to('orders#edit', id: '1') }
  specify { expect(patch:  '/orders/1'     ).to route_to('orders#update', id: '1') }
  specify { expect(delete: '/orders/1'     ).to route_to('orders#destroy', id: '1') }
end
