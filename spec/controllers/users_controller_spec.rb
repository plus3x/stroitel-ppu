describe UsersController do
  let(:admin)  { create :user, :admin }
  before { login_as admin }

  it_has_behavior   'action index for', :users
  it_has_behavior    'action show for', :user
  it_has_behavior     'action new for', :user
  it_has_behavior    'action edit for', :user
  it_has_behavior  'action update for', :user
  it_has_behavior 'action destroy for', :user
  it_has_behavior  'action create for', :user do
    before { @valid_attributes = { name: 'John', password: 'secret', password_confirmation: 'secret' } }
  end
end
