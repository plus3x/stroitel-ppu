require 'rubygems'
require 'sitemap_generator'

SitemapGenerator::Sitemap.default_host = 'http://stroitel-ppu.ru'
SitemapGenerator::Sitemap.create do
  add '/main',     changefreq: 'daily', priority: 0.9
  add '/contacts', changefreq: 'weekly'
end
SitemapGenerator::Sitemap.ping_search_engines # Not needed if you use the rake tasks