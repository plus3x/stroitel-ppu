describe ServicesController do
  let(:admin)  { create :user, :admin }

  it_has_behavior   'action index for', :services
  it_has_behavior    'action show for', :service
  it_has_behavior     'action new for', :service do before { login_as admin } end
  it_has_behavior    'action edit for', :service do before { login_as admin } end
  it_has_behavior  'action update for', :service do before { login_as admin } end
  it_has_behavior 'action destroy for', :service do before { login_as admin } end
  it_has_behavior  'action create for', :service do
    before { login_as admin }
    before do
      @valid_attributes = {
        name:        'name',
        description: 'description',
        picture_url: 'picture_url',
        title:       'title',
        seo_meta_attributes: { keywords: 'keywords', description: 'description' }
      }
    end
  end
end
