describe SessionsController do
  specify { expect(get:    '/login' ).to route_to('sessions#new') }
  specify { expect(post:   '/login' ).to route_to('sessions#create') }
  specify { expect(delete: '/logout').to route_to('sessions#destroy') }
end
