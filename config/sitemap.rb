# Wiki: https://github.com/kjvarga/sitemap_generator
# Instruction https://github.com/kjvarga/sitemap_generator/wiki/Generate-Sitemaps-on-read-only-filesystems-like-Heroku

# Set the host name for URL creation
YANDEX_SITEMAP_TEST_URL = 'http://webmaster.yandex.ru/sitemaptest.xml?host=%s'
SitemapGenerator::Sitemap.default_host  = 'www.stroitel-ppu.ru'
SitemapGenerator::Sitemap.public_path   = 'tmp/'
SitemapGenerator::Sitemap.create_index  = true
SitemapGenerator::Sitemap.namer         = SitemapGenerator::SimpleNamer.new(:sitemap, zero: '_index')
SitemapGenerator::Sitemap.adapter       = SitemapGenerator::S3Adapter.new
SitemapGenerator::Sitemap.sitemaps_host = "http://#{ENV['FOG_DIRECTORY']}.s3.amazonaws.com/"
SitemapGenerator::Sitemap.sitemaps_path = 'sitemaps/'

SitemapGenerator::Sitemap.create do
  add main_path,       lastmod: File.mtime('app/views/static_pages/main.html.slim')
  add about_path,      lastmod: File.mtime('app/views/static_pages/about.html.slim')
  add contacts_path,   lastmod: File.mtime('app/views/static_pages/contacts.html.slim')
  add production_path, lastmod: File.mtime('app/views/static_pages/production.html.slim')

  def last_update_index(name)
    file_modifie   = File.mtime("app/views/#{name}/index.html.slim")
    models_modifie = name.classify.constantize.maximum(:updated_at)
    [file_modifie, models_modifie].max
  end

  type_of_products_updated_at = last_update_index('type_of_products')
          products_updated_at = last_update_index('products')

  add services_path, lastmod: last_update_index('services'), changefreq: :daily,  priority: 0.7

  Service.all.each do |service|
    add service_path(service), lastmod: service.updated_at
    add service_type_of_products_path(service), lastmod: type_of_products_updated_at, changefreq: :daily,  priority: 0.7

    service.type_of_products.each do |type_of_product|
      add service_type_of_product_path(service, type_of_product), lastmod: type_of_product.updated_at
      add service_type_of_product_products_path(service, type_of_product), lastmod: products_updated_at, changefreq: :daily,  priority: 0.7

      type_of_product.products.each do |product|
        add service_type_of_product_product_path(service, type_of_product, product), lastmod: product.updated_at
      end
    end
  end
end

SitemapGenerator::Sitemap.ping_search_engines(yandex: YANDEX_SITEMAP_TEST_URL % 'www.stroitel-ppu.ru')
