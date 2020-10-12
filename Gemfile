source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.7.1"

gem "bootsnap", require: false
gem "jbuilder"
gem "pg"
gem "puma"
gem "rails", "~> 6.0.3"
gem "sass-rails"
gem "turbolinks"
gem "webpacker"

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
  gem "bundler-audit", ">= 0.7.0", require: false
  gem "factory_bot_rails"
  gem "rspec-rails"
  gem "standard"
end

group :development do
  gem "listen"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
  gem "web-console"
end

group :test do
  gem "launchy"
  gem "shoulda-matchers"
  gem "webdrivers"
end

gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
