describe DebtorsController do
  specify { expect(get:    '/debtors'       ).to route_to('debtors#index') }
  specify { expect(get:    '/debtors/new'   ).to route_to('debtors#new') }
  specify { expect(post:   '/debtors  '     ).to route_to('debtors#create') }
  specify { expect(get:    '/debtors/1'     ).to route_to('debtors#show', id: '1') }
  specify { expect(get:    '/debtors/1/edit').to route_to('debtors#edit', id: '1') }
  specify { expect(patch:  '/debtors/1'     ).to route_to('debtors#update', id: '1') }
  specify { expect(delete: '/debtors/1'     ).to route_to('debtors#destroy', id: '1') }
end
