source 'https://rubygems.org'
ruby '2.1.1'

gem 'rails', '4.1.0'
gem 'bcrypt-ruby'

gem 'slim'
# gem 'dynamic_form'
gem 'sass-rails', '~> 4.0.3'
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
  # gem 'guard-rspec', require: false
end

group :development, :test do
  gem 'sqlite3'
  gem 'pry-rails'
  # gem 'rspec-rails', '3.0.0.beta2'
end

group :test do
  # gem 'factory_girl_rails'
  # gem 'database_cleaner'
  # gem 'minitest'
  # gem 'shoulda-matchers'
  # gem 'capybara'
end