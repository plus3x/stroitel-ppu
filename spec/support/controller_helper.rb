module ControllerHelper
  shared_examples_for 'action index for' do |resources|
    describe 'GET index' do
      let(:model) { resources.to_s.singularize.camelize.constantize }
      it "assigns all #{resources} as @#{resources}" do
        get :index
        expect(assigns(resources)).to eq(model.all)
        expect(response).to render_template :index
      end
    end
  end

  shared_examples_for 'action show for' do |resource|
    describe 'GET show' do
      let!(:element) { create resource }
      it "assigns the requested #{resource} as @#{resource}" do
        get :show, id: element.id
        expect(assigns(resource).id).to eq element.id
        expect(response).to render_template :show
      end
    end
  end

  shared_examples_for 'action new for' do |resource|
    describe 'GET new' do
      let(:model) { resource.to_s.camelize.constantize }
      it "assigns a new #{resource} as @#{resource}" do
        get :new
        expect(assigns(resource)).to be_a_new(model)
        expect(response).to render_template :new
      end
    end
  end

  shared_examples_for 'action edit for' do |resource|
    describe 'GET new' do
      let(:element) { create resource }
      it "assigns the requested #{resource} as @#{resource}" do
        get :edit, id: element.id
        expect(assigns(resource).id).to eq element.id
        expect(response).to render_template :edit
      end
    end
  end

  shared_examples_for 'action create for' do |resource|
    describe 'POST create' do
      let(:valid_attributes) { build(resource).attributes }
      let(:model) { resource.to_s.camelize.constantize }
      describe 'with valid params' do
        it "creates a new #{resource.to_s.capitalize}" do
          expect do
            post :create, resource => (@valid_attributes || valid_attributes)
          end.to change(model, :count).by(1)
        end

        it "assigns a newly created #{resource} as @#{resource}" do
          post :create, resource => (@valid_attributes || valid_attributes)
          expect(assigns(resource)).to be_a(model)
          expect(assigns(resource)).to be_persisted
        end

        it "redirects to the created #{resource}" do
          post :create, resource => (@valid_attributes || valid_attributes)
          expect(response).to redirect_to model.last
        end
      end

      describe 'with invalid params' do
        it "assigns a newly created but unsaved #{resource} as @#{resource}" do
          allow_any_instance_of(model).to receive_messages(save: false)
          post :create, resource => (@valid_attributes || valid_attributes)
          expect(assigns(resource)).to be_a_new(model)
        end

        it 're-renders the new template' do
          allow_any_instance_of(model).to receive_messages(save: false)
          post :create, resource => (@valid_attributes || valid_attributes)
          expect(response).to render_template :new
        end
      end
    end
  end

  shared_examples_for 'action update for' do |resource|
    describe 'PUT update' do
      let(:element) { create resource }
      let(:valid_attributes) { element.attributes }
      let(:model) { resource.to_s.camelize.constantize }
      describe 'with valid params' do
        it "updates the requested #{resource}" do
          param = valid_attributes.keys[1]
          value = valid_attributes.values[1]
          expect_any_instance_of(model).to receive(:update).with({ param => value })
          put :update, id: element.id, resource => { param => value }
        end

        it "assigns the requested #{resource} as @#{resource}" do
          put :update, id: element.id, resource => valid_attributes
          expect(assigns(resource).id).to eq element.id
        end

        it "redirects to the #{resource}" do
          put :update, id: element.id, resource => valid_attributes
          expect(response).to redirect_to element
        end
      end

      describe 'with invalid params' do
        it "assigns the #{resource} as @#{resource}" do
          allow_any_instance_of(model).to receive_messages(save: false)
          put :update, id: element.id, resource => valid_attributes
          expect(assigns(resource).id).to eq element.id
        end

        it 're-renders the edit template' do
          allow_any_instance_of(model).to receive_messages(save: false)
          put :update, id: element.id, resource => valid_attributes
          expect(response).to render_template :edit
        end
      end
    end
  end

  shared_examples_for 'action destroy for' do |resource|
    describe 'DELETE destroy' do
      let(:element) { create resource }
      let(:valid_attributes) { element.attributes }
      let(:model) { resource.to_s.camelize.constantize }
      it "destroys the requested #{resource}" do
        element = create(resource)
        expect do
          delete :destroy, id: element.id
        end.to change(model, :count).by(-1)
      end

      it "redirects to the #{resource}s list" do
        element = create(resource)
        delete :destroy, id: element.id
        expect(response).to redirect_to action: :index
      end
    end
  end
end
