source 'https://rubygems.org'
ruby '2.1.1'

gem 'rails', '4.1.0'
gem 'bcrypt'

gem 'slim'
gem 'dynamic_form'
gem 'sass-rails',   '~> 4.0.3'
gem 'coffee-rails', '~> 4.0.0'

group :production do
  gem 'sitemap_generator'
  gem 'carrierwave'
  gem 'rails_12factor'
  gem 'pg'
end

group :production, :development do
  gem 'uglifier', '>= 1.3.0'
  gem 'turbolinks'
  gem 'jquery-rails'
end

group :development do
  gem 'spring'
end

group :development, :test do
  gem 'sqlite3'
  gem 'pry-rails'
end

group :test do
  gem 'shoulda'
end