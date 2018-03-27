source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

# gem 'coffee-rails', '~> 4.2'
# gem 'jbuilder', '~> 2.5'
gem 'devise'
gem 'devise-i18n'
gem 'dotenv-rails', require: 'dotenv/rails-now'
gem 'font_awesome5_rails'
gem 'lazy_high_charts'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.7'
gem 'rack-dev-mark'
gem 'rails', '~> 5.1.4'
gem 'sass-rails', '~> 5.0'
gem 'slim-rails'
gem 'turbolinks', '~> 5'
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem 'uglifier', '>= 1.3.0'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'html2slim'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'pry-byebug'
  gem 'pry-doc'
  gem 'pry-rails'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

