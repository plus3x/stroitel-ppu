describe User do
  subject(:user) { build :user }

  it { is_expected.to be_valid }

  it 'must have enum role' do
    expect(User.roles).to eq({'admin'=>'Role::Admin', 'manager'=>'Role::Manager', 'guest'=>'Role::Guest'})
  end

  describe 'must be STI model' do
    User.roles.each_value do |role_class_name|
      it { expect(User.new role: role_class_name).to be_a(role_class_name.constantize) }
    end
  end

  describe 'self.model_name' do
    it { expect(User.model_name).to eq ActiveModel::Name.new(User) }
  end

  describe 'can?' do
    let(:guest)   { User.new role: 'Role::Guest'   }
    let(:admin)   { User.new role: 'Role::Admin'   }
    let(:manager) { User.new role: 'Role::Manager' }

    it { expect(  guest.can?(:create, :user)    ).to be false }
    it { expect(  admin.can?(:create, :user)    ).to be true  }
    it { expect(manager.can?(:new,    :services)).to be true  }
  end
end
