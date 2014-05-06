source 'https://rubygems.org'
source 'https://rails-assets.org'
ruby '2.1.1'

gem 'annotate', ">=2.6.0"
gem 'bcrypt-ruby', '~> 3.1.5'
gem 'braintree'
gem 'bugsnag'
gem 'coffee-rails', '~> 4.0.0'
gem 'httparty'
gem 'jquery-rails'
gem 'pg'
gem 'progressbar', "~> 0.21.0"
gem 'puma'
gem 'rails', '4.1.0'
gem 'rails-assets-bootstrap'
gem 'redis'
gem 'sass-rails', '~> 4.0.0'
gem 'sidekiq'
gem 'sinatra', '>= 1.3.0', :require => nil
gem 'turbolinks'
gem 'uglifier', '>= 1.3.0'

group :development do
  gem 'brakeman', require: false
  gem 'faker'
  gem 'hirb'
end

group :test do
  gem 'capybara'
  gem 'factory_girl_rails', '4.2.1'
  gem 'growl', '1.0.3'
  gem 'launchy'
  gem 'minitest'
  gem 'selenium-webdriver', '2.35.1'
end

group :development, :test do
  gem 'childprocess', '0.5.2'
  gem 'spork-rails', '4.0.0'
end

group :production, :staging do
  gem 'rails_12factor'
end