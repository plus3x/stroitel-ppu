describe 'layouts/application' do
  let(:page_title      ) { I18n.t '.layouts.application.default_page_title'         }
  let(:meta_keywords   ) { I18n.t '.application.meta_data.default_meta_keywords'    }
  let(:meta_description) { I18n.t '.application.meta_data.default_meta_description' }
  before { render }
  subject(:page) { Capybara.string rendered }
  before { Capybara.ignore_hidden_elements = false }

  it 'must have SEO meta data' do
    is_expected.to have_selector 'head title', text: page_title
    is_expected.to have_selector "head meta[name='Keywords'   ][content='#{meta_keywords}']"
    is_expected.to have_selector "head meta[name='Description'][content='#{meta_description}']"
    is_expected.to have_selector "head meta[name='googlebot'  ][content='all']"
    is_expected.to have_selector "head meta[name='robots'     ][content='all']"
    is_expected.to have_selector "head meta[content='text/html; charset=utf-8'][http-equiv='Content-Type']"
  end
end
