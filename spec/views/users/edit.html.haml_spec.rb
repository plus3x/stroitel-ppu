describe 'users/edit' do
  before do
    @user = assign(:user, stub_model(User,
      name: 'MyString',
      password: 'MyString',
      password_confirmation: 'MyString'
    ))
  end
  before { render }
  subject(:page) { Capybara.string rendered }


  it 'renders the edit user form' do
    is_expected.to have_selector "form[action='#{user_path(@user)}'][method='post']" do |form|
      expect(form).to have_selector 'input#user_name',                  name: 'user[name]'
      expect(form).to have_selector 'input#user_password',              name: 'user[password]'
      expect(form).to have_selector 'input#user_password_confirmation', name: 'user[password_confirmation]'
      expect(form).to have_selector 'select#user_role',                 name: 'user[role]'
    end
  end
end
