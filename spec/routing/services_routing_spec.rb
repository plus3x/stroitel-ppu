describe ServicesController do
  specify { expect(get:    '/services'       ).to route_to('services#index') }
  specify { expect(get:    '/services/new'   ).to route_to('services#new') }
  specify { expect(post:   '/services  '     ).to route_to('services#create') }
  specify { expect(get:    '/services/1'     ).to route_to('services#show', id: '1') }
  specify { expect(get:    '/services/1/edit').to route_to('services#edit', id: '1') }
  specify { expect(patch:  '/services/1'     ).to route_to('services#update', id: '1') }
  specify { expect(delete: '/services/1'     ).to route_to('services#destroy', id: '1') }
end
