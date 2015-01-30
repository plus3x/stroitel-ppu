describe 'users/new' do
  before do
    assign(:user, stub_model(User,
      name: 'MyString', password: 'MyString', password_confirmation: 'MyString'
    ).as_new_record)
  end
  before { render }
  subject(:page) { Capybara.string rendered }

  it 'renders new user form' do
    is_expected.to have_selector "form[action='#{users_path}'][method='post']" do |form|
      expect(form).to have_selector 'input#user_name',                  name: 'user[name]'
      expect(form).to have_selector 'input#user_password',              name: 'user[password]'
      expect(form).to have_selector 'input#user_password_confirmation', name: 'user[password_confirmation]'
      expect(form).to have_selector 'select#user_role',                 name: 'user[role]'
    end
  end
end
