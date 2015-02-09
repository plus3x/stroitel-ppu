describe OrdersController do
  let(:admin)  { create :user, :admin }

  it_has_behavior   'action index for', :orders do before { login_as admin } end
  it_has_behavior    'action show for', :order  do before { login_as admin } end
  it_has_behavior     'action new for', :order
  it_has_behavior    'action edit for', :order  do before { login_as admin } end
  it_has_behavior  'action update for', :order  do before { login_as admin } end
  it_has_behavior 'action destroy for', :order  do before { login_as admin } end
  it_has_behavior  'action create for', :order do
    before { @valid_attributes = { email: 'john@mail.com', description: 'description' } }
  end
end
