source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails',          '5.1.2'
gem 'puma',           '3.9.1'
gem 'sass-rails',     '5.0.6'
gem 'uglifier',       '3.2.0'
gem 'coffee-rails',   '4.2.2'
gem 'jquery-rails',   '4.3.1'
gem 'turbolinks',     '5.0.1'
gem 'jbuilder',       '2.7.0'
gem 'bootstrap-sass', '3.3.7'
gem 'autoprefixer-rails'
gem 'pg', '0.18.4'
gem 'byebug',  '9.0.6', platform: :mri

group :development, :test do
  gem 'rspec-rails'
end

group :development do
  gem 'web-console',           '3.5.1'
  gem 'listen',                '3.0.8'
  gem 'spring',                '2.0.2'
  gem 'spring-watcher-listen', '2.0.1'
  gem 'annotate'
end

group :test do
  gem "factory_bot_rails"
  gem "capybara"
  gem 'rb-inotify'
  gem 'libnotify'
  gem "guard-rspec"
#  gem "guard-spork"
  gem 'childprocess'
#  gem 'spork'
  gem 'shoulda-matchers', '~> 3.0', require: false
  gem 'database_cleaner', '~> 1.5'
  gem 'faker'
end

group :production do
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
