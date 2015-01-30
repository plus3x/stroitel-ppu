describe ApplicationHelper do
  describe 'current user' do
    let(:user) { create :user }

    it 'current user must be new user if session nil' do
      session[:user_id] = nil
      expect(current_user).to be_a_new(User)
    end

    it 'must get current user by session' do
      session[:user_id] = user.id
      expect(current_user).to be_guest
    end

    it 'must remember current user' do
      helper.instance_variable_set(:@_current_user, user)
      expect(current_user).to be_guest
    end
  end
end
