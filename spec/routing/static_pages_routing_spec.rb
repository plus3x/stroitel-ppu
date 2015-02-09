describe StaticPagesController do
  specify { expect(get: '/main'      ).to route_to('static_pages#main') }
  specify { expect(get: '/contacts'  ).to route_to('static_pages#contacts') }
  specify { expect(get: '/about'     ).to route_to('static_pages#about') }
  specify { expect(get: '/production').to route_to('static_pages#production') }
end
