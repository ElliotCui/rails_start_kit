source 'https://gems.ruby-china.org/'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.1.5'
gem 'mysql2'

gem 'jquery-rails', '~> 4.3.1'
gem 'jquery-validation-rails'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'haml', '~> 5.0.1'

gem 'bootstrap-sass', '~> 3.3.7'
gem 'bootstrap_sb_admin_base_v2', '~> 0.3.6'
gem 'will_paginate-bootstrap', '~> 1.0.1'
gem 'momentjs-rails', '~> 2.17.1'
gem 'bootstrap3-datetimepicker-rails', '~> 4.17.47'

# gem "rack-attack", '~> 5.0.1'
gem "nokogiri", '1.8.2'
gem 'redis', '~> 4.0'
gem "bcrypt-ruby", :require => "bcrypt"

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'

  gem 'pry-rails', '~> 0.3.4'
  # gem 'capistrano', '~> 3.9'
  # gem 'capistrano-rails', "~> 1.3.0"
  # gem 'capistrano-rvm', "~> 0.1.2"
  # gem 'capistrano3-puma', "~> 3.1.1"
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
