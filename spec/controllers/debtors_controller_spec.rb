describe DebtorsController do
  let(:admin)  { create :user, :admin }

  it_has_behavior   'action index for', :debtors do before { login_as admin } end
  it_has_behavior    'action show for', :debtor
  it_has_behavior     'action new for', :debtor  do before { login_as admin } end
  it_has_behavior    'action edit for', :debtor  do before { login_as admin } end
  it_has_behavior  'action update for', :debtor  do before { login_as admin } end
  it_has_behavior 'action destroy for', :debtor  do before { login_as admin } end
  it_has_behavior  'action create for', :debtor do
    before { login_as admin }
    before { @valid_attributes = { email: 'john@mail.com', description: 'description' } }
  end
end
