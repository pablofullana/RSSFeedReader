source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.0'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'

gem "therubyracer"
gem "less-rails"
gem "twitter-bootstrap-rails"


# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'


# Use haml for html markup
gem 'haml'
gem 'haml-rails'

# To convert html to haml
gem 'html2haml'

# Use devise for users administration
gem 'devise'

# Google OAuth2
gem 'omniauth-google-oauth2'


# Development and test gems
group :development, :test do
  gem 'sqlite3'
  #gem 'ruby-debug19', :require => 'ruby-debug'
  gem 'debugger'
  gem 'launchy'
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'simplecov'
end

# Test gems
group :test do
  gem 'cucumber-rails', :require => false
  gem 'cucumber-rails-training-wheels'
  gem 'database_cleaner', '< 1.1.0'       # a higher one breaks sqlite3 tests
  gem 'capybara'
  gem 'email_spec'
end

# Production gems
group :production do
  gem 'pg'
end

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end


# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]
