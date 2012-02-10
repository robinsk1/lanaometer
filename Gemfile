source 'http://rubygems.org'

gem 'rails', '3.1.3'

gem 'haml'
gem 'haml-rails', :group => :development
gem 'pg'
gem 'simple_form'
gem 'google_places_autocomplete'
gem 'google_places'
gem 'geokit'
gem 'geokit-rails3'
gem 'guardian-content', :git => "https://github.com/chrsgrrtt/contentapi-ruby.git"

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.1.5'
  gem 'coffee-rails', '~> 3.1.1'
  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'
gem 'newrelic_rpm'
gem 'seed-fu', '~> 2.1.0'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger

group :production do
  gem 'execjs'
  gem 'therubyracer'
end

group :development do
  gem 'ruby-debug19', :require => 'ruby-debug'
  gem 'heroku'
end

group :test do
  # Pretty printed test output
  gem 'rails3-generators'
  gem 'database_cleaner'
  gem 'factory_girl_rails'
  gem 'rspec'
  gem 'rspec-rails'
  gem 'capybara'
  gem 'steak'
  gem 'turn', '0.8.2', :require => false
end