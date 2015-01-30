describe 'users/index' do
  before do
    assign(:users, [
      stub_model(User, name: 'Name', password: 'Password', password_confirmation: 'Password Confirmation'),
      stub_model(User, name: 'Name', password: 'Password', password_confirmation: 'Password Confirmation')
    ])
  end
  before { render }
  subject(:page) { Capybara.string rendered }

  it 'renders a list of users' do
    is_expected.to have_selector 'tr td', text:  'Name', count: 2
  end
end
