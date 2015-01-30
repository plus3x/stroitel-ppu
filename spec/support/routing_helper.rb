module RoutingHelper
  shared_examples_for 'a routing to resource' do |resource|
    it 'routes to #index' do
      expect(get: "/#{resource}").to route_to("#{resource}#index")
    end

    it 'routes to #new' do
      expect(get: "/#{resource}/new").to route_to("#{resource}#new")
    end

    it 'routes to #show' do
      expect(get: "/#{resource}/1").to route_to("#{resource}#show", id: '1')
    end

    it 'routes to #edit' do
      expect(get: "/#{resource}/1/edit").to route_to("#{resource}#edit", id: '1')
    end

    it 'routes to #create' do
      expect(post: "/#{resource}").to route_to("#{resource}#create")
    end

    it 'routes to #update' do
      expect(put: "/#{resource}/1").to route_to("#{resource}#update", id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: "/#{resource}/1").to route_to("#{resource}#destroy", id: '1')
    end
  end
end
