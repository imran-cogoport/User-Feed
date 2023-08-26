source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.8', engine: 'jruby', engine_version: '9.3.10.0'
#
# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails",'~> 6.1.4'

# using postgres db for active record
gem 'activerecord-jdbcpostgresql-adapter'
gem 'activerecord-postgis-adapter'

gem 'active_interaction'

gem 'dotenv-rails', groups: [:development]

# Use the Puma web server [https://github.com/puma/puma]
gem "puma"

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
# gem "jbuilder"

# Use Redis adapter to run Action Cable in production
# gem "redis", "~> 4.0"

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
# gem "rack-cors"
group :development do
  gem 'pry-debugger-jruby'
end

