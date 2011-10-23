source 'http://rubygems.org'

gem 'rails', '3.1.1'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

gem 'bson_ext'
gem 'mongoid'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails', "  ~> 3.1.0"
  gem 'coffee-rails', "~> 3.1.0"
  gem 'uglifier'
end

gem 'jquery-rails'
gem 'haml-rails'

gem 'compass', '~> 0.12.alpha'

gem 'sorcery'
gem 'cancan'

group :test, :development do
  gem "rspec-rails", "~> 2.4"
end

group :test do
  gem "factory_girl_rails"
  gem 'mongoid-rspec'
  gem 'database_cleaner'
  gem "guard-rspec"
  gem "spork", "> 0.9.0.rc"
  gem "guard-spork"
  gem 'capybara'
end

group :development do
  gem 'letter_opener'
  gem 'powder'
end

