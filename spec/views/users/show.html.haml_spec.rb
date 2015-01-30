describe 'users/show' do
  before do
    @user = assign(:user, stub_model(User,
      name: 'Name', password: 'Password', password_confirmation: 'Password Confirmation'
    ))
  end
  before { render }
  subject(:page) { Capybara.string rendered }

  it 'renders attributes on page' do
    is_expected.to have_selector 'p', text: 'Name'
  end
end
