# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "http://www.stroitel-ppu.ru"

SitemapGenerator::Sitemap.public_path   = 'tmp/'
SitemapGenerator::Sitemap.sitemaps_path = ''
SitemapGenerator::Sitemap.create_index  = true
SitemapGenerator::Sitemap.namer         = SitemapGenerator::SimpleNamer.new(:sitemap, zero: '_index')
SitemapGenerator::Sitemap.adapter       = SitemapGenerator::WaveAdapter.new
SitemapGenerator::Sitemap.ping_search_engines(yandex: 'http://webmaster.yandex.ru/sitemaptest.xml?host=www.stroitel-ppu.ru')

SitemapGenerator::Sitemap.create do
  add main_path,       lastmod: File.mtime('app/views/static_pages/main.html.slim')
  add about_path,      lastmod: File.mtime('app/views/static_pages/about.html.slim')
  add contacts_path,   lastmod: File.mtime('app/views/static_pages/contacts.html.slim')
  add production_path, lastmod: File.mtime('app/views/static_pages/production.html.slim')
  
          services_updated_at = [File.mtime('app/views/services/index.html.slim'),               Service.maximum(:updated_at)].max
  type_of_products_updated_at = [File.mtime('app/views/type_of_products/index.html.slim'), TypeOfProduct.maximum(:updated_at)].max
          products_updated_at = [File.mtime('app/views/products/index.html.slim'),               Product.maximum(:updated_at)].max
  
  add services_path, lastmod: services_updated_at, changefreq: :daily,  priority: 0.7
  
  Service.all.each do |service| 
    add "/services/#{service.id}", lastmod: service.updated_at
    add service_type_of_products_path(service), lastmod: type_of_products_updated_at, changefreq: :daily,  priority: 0.7
    service.type_of_products.each do |type_of_product|
      add "/services/#{service.id}/type_of_products/#{type_of_product.id}", lastmod: type_of_product.updated_at
      add service_type_of_product_products_path(service, type_of_product), lastmod: products_updated_at, changefreq: :daily,  priority: 0.7
      type_of_product.products.each do |product|
        add "/services/#{service.id}/type_of_products/#{type_of_product.id}/products/#{product.id}", lastmod: product.updated_at
      end
    end
  end
  
  # Put links creation logic here.
  #
  # The root path '/' and sitemap index file are added automatically for you.
  # Links are added to the Sitemap in the order they are specified.
  #
  # Usage: add(path, options={})
  #        (default options are used if you don't specify)
  #
  # Defaults: :priority => 0.5, :changefreq => 'weekly',
  #           :lastmod => Time.now, :host => default_host
  #
  # Examples:
  #
  # Add '/articles'
  #
  #   add articles_path, :priority => 0.7, :changefreq => 'daily'
  #
  # Add all articles:
  #
  #   Article.find_each do |article|
  #     add article_path(article), :lastmod => article.updated_at
  #   end
end
