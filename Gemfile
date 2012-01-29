source 'https://rubygems.org'

gem 'rails', '3.2.1'
gem 'bcrypt-ruby', '3.0.1'

group :development do
  gem 'guard-rspec', '0.5.5'
  gem 'annotate', '~> 2.4.1.beta'
end

group :development, :test do
  gem 'sqlite3', '1.3.5'
  gem 'rspec-rails', '2.8.1'
end

group :test do
  # Pretty printed test output
  gem 'turn', '0.8.2', :require => false
  gem 'capybara', '1.1.2'
  gem 'guard-spork', '0.3.2'
  gem 'spork', '0.9.0.rc'
  # System depedent gems
  # Mac OS X
  gem 'rb-fsevent', '0.4.3.1', :require => false
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
  gem 'pg', '0.12.2'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  gem 'uglifier', '>= 1.0.3'
  gem 'therubyracer'
end

gem 'jquery-rails', '1.0.18'

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
