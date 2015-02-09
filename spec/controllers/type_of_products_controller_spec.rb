describe TypeOfProductsController do
  let!(:service) { create :service }
  let!(:admin)   { create :user, :admin }
  let!(:type_of_product) { create :type_of_product, service: service }

  specify 'GET #index' do
    get :index, service_id: service.id
    expect(response).to be_success.and render_template :index
    expect(assigns(:type_of_products)).to eq TypeOfProduct.all
  end

  specify 'GET #new' do
    login_as admin
    get :new, service_id: service.id
    expect(response).to be_success.and render_template :new
  end

  specify 'GET #show' do
    get :show, service_id: service.id, id: type_of_product.id
    expect(response).to be_success.and render_template :show
  end

  specify 'GET #edit' do
    login_as admin
    get :edit, service_id: service.id, id: type_of_product.id
    expect(response).to be_success.and render_template :edit
  end

  describe 'POST #create' do
    before { login_as admin }
    let(:create!) { -> { post :create, service_id: service.id, type_of_product: attributes } }

    context 'with valid params' do
      let(:attributes) { build(:type_of_product).attributes }

      specify do
        expect(create!).to change(TypeOfProduct, :count).by(1)
        expect(assigns(:type_of_product)).to be_a TypeOfProduct
        expect(assigns(:type_of_product)).to be_persisted
        expect(response).to redirect_to [service, TypeOfProduct.last]
      end
    end

    context 'with invalid params' do
      let(:attributes) { { invalid: :attributes } }

      specify do
        expect(create!).not_to change(TypeOfProduct, :count)
        expect(assigns(:type_of_product)).to be_a_new TypeOfProduct
        expect(response).to render_template :new
      end
    end
  end

  describe 'PATCH/PUT #update' do
    before { login_as admin }
    let(:update!) do
      lambda do
        patch :update, service_id: service.id, id: type_of_product.id, type_of_product: attributes
      end
    end

    context 'with valid params' do
      let(:attributes) { { name: 'new name' } }

      specify do
        expect(update!).to change { type_of_product.reload.name }.to 'new name'
        expect(response).to redirect_to [service, type_of_product]
      end
    end

    context 'with invalid params' do
      let(:attributes) { { name: nil } }

      specify do
        expect(update!).not_to change { type_of_product.reload.name }
        expect(response).to be_success, 'Response must be success'
        expect(response).to render_template :edit
      end
    end
  end

  describe 'DELETE #destroy' do
    before { login_as admin }
    let(:destroy!) { -> { delete :destroy, service_id: service.id, id: type_of_product_id } }

    describe 'exist' do
      let(:type_of_product_id) { type_of_product.id }

      specify do
        expect(destroy!).to change(TypeOfProduct, :count).by(-1)
        expect(response).to redirect_to service
      end
    end

    describe 'not exist' do
      let(:type_of_product_id) { 1234 }

      specify { expect(destroy!).to raise_error ActiveRecord::RecordNotFound }
    end
  end
end
