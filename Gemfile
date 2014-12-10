source 'https://rubygems.org'
ruby '2.1.2'

gem 'rails', '~> 4.1'
gem 'bcrypt'

gem 'slim'
gem 'dynamic_form'
gem 'bootstrap-sass'
gem 'bootsy'

group :assets do
  gem 'sass-rails',   '~> 4.0.3'
  gem 'coffee-rails', '~> 4.0.0'
end

group :test do
  gem 'shoulda'
  # gem 'factory_girl_rails'
  # gem 'database_cleaner'
  # gem 'minitest'
  # gem 'shoulda-matchers'
  # gem 'capybara'
end

group :development do
  gem 'spring'
end

group :development, :test do
  gem 'sqlite3'
  gem 'pry-rails'
end

group :production, :development do
  gem 'uglifier', '>= 1.3.0'
  gem 'turbolinks'
  gem 'jquery-rails'
end

group :production do
  gem 'sitemap_generator'
  gem 'fog'
  gem 'rails_12factor'
  gem 'pg'
end
