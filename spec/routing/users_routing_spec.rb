describe UsersController do
  specify { expect(get:    '/users'       ).to route_to('users#index') }
  specify { expect(get:    '/users/new'   ).to route_to('users#new') }
  specify { expect(post:   '/users  '     ).to route_to('users#create') }
  specify { expect(get:    '/users/1'     ).to route_to('users#show', id: '1') }
  specify { expect(get:    '/users/1/edit').to route_to('users#edit', id: '1') }
  specify { expect(patch:  '/users/1'     ).to route_to('users#update', id: '1') }
  specify { expect(delete: '/users/1'     ).to route_to('users#destroy', id: '1') }
end
