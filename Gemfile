source 'https://rubygems.org'

#############################
# Environment-agnostic gems #
#############################

gem 'rails', '3.2.13'
gem 'jquery-rails'                              # javascript library
gem 'haml'
gem 'bcrypt-ruby'
gem 'validates_email_format_of'
gem 'heroku'


#############################
# Environment-specific gems #
#############################

group :production do
  gem 'pg'
end

group :development do
  gem 'sqlite3'
end


# The :assets group is for building static assets
group :assets do
  gem 'sass-rails',   '~> 3.2.3'                # syntatically awesome stylesheets - sass-lang.com for more info
  gem 'therubyracer', :require => 'v8'                            # javascript runtime to support coffeescript
end


group :test do
  gem 'capybara'                                # integration testing DSL
  gem 'capybara-webkit'                         # browser driver for capybara
end

group :test, :development do
  gem 'simplecov'                               # test coverage gem
  gem 'debugger'
  gem 'rspec-rails'                             # spec and testing framework
  gem 'guard'                                   # for running specs during development
  gem 'guard-rspec'
  gem 'factory_girl_rails'                      # Factories for creating test objects
  gem 'faker'
end
