describe StaticPagesController do
  describe 'GET #main' do
    subject! { get :main }

    specify { is_expected.to be_success }
    specify { is_expected.to render_template :main }
  end

  describe 'GET #contacts' do
    subject! { get :contacts }

    specify { is_expected.to be_success }
    specify { is_expected.to render_template :contacts }
  end

  describe 'GET #production' do
    subject! { get :production }

    specify { is_expected.to be_success }
    specify { is_expected.to render_template :production }
  end

  describe 'GET #about' do
    subject! { get :about }

    specify { is_expected.to be_success }
    specify { is_expected.to render_template :about }
  end
end
