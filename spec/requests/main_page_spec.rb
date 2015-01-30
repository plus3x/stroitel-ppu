describe 'Main page' do
  let(:page_title      ) { I18n.t '.static_pages.main.page_title'       }
  let(:meta_keywords   ) { I18n.t '.static_pages.main.meta_keywords'    }
  let(:meta_description) { I18n.t '.static_pages.main.meta_description' }
  before { Capybara.ignore_hidden_elements = false }

  it 'must have SEO meta data' do
    visit main_path

    within 'head' do
      expect(page).to have_selector 'title', text: page_title
      expect(page).to have_selector "meta[name='Keywords'   ][content='#{meta_keywords}']"
      expect(page).to have_selector "meta[name='Description'][content='#{meta_description}']"
      expect(page).to have_selector "meta[name='googlebot'  ][content='all']"
      expect(page).to have_selector "meta[name='robots'     ][content='all']"
      expect(page).to have_selector "meta[content='text/html; charset=utf-8'][http-equiv='Content-Type']"
    end
  end
end
