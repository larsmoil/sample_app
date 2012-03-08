source 'https://rubygems.org'

gem 'rails', '3.2.2'
gem 'bcrypt-ruby', '3.0.1'
gem 'faker', '1.0.1'
gem 'will_paginate', '3.0.3'

group :development do
  gem 'guard-rspec', '0.6.0'
  gem 'annotate', '~> 2.4.1.beta'
  gem 'guard-annotate'
  gem 'guard-cucumber'
  gem 'guard-livereload'
  gem 'rack-livereload'
  gem 'fuubar'
end

group :development, :test do
  gem 'sqlite3', '1.3.5'
  gem 'rspec-rails', '2.8.1'
end

group :test do
  # Pretty printed test output
  gem 'turn', '0.9.3', :require => false
  gem 'capybara', '1.1.2'
  gem 'guard-spork', '0.5.2'
  gem 'spork', '1.0.0rc2'
  gem 'factory_girl_rails', '1.7.0'
  gem 'cucumber-rails', '1.3.0'
  gem 'database_cleaner', '0.7.1'
  gem 'guard-bundler'
  # System depedent gems
  # Mac OS X
  gem 'rb-fsevent', '0.9.0', :require => false
  gem 'growl', '1.0.3'
  # Linux
  #gem 'rb-inotify', '0.8.8'
  #gem 'libnotify', '0.5.9'
  # Windows
  #gem 'rb-fchange', '0.0.5'
  #gem 'rb-notifu', '0.0.4'
  #gem 'win32console', '1.3.0'
end

group :production do
  gem 'pg', '0.13.2'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  gem 'uglifier', '>= 1.0.3'
  gem 'therubyracer'
end

gem 'jquery-rails', '2.0.1'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'
