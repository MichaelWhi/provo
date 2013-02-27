source 'https://rubygems.org'
ruby '1.9.3'

gem 'rails',     github: 'rails/rails'
gem 'arel',      github: 'rails/arel'
gem 'activerecord-deprecated_finders', github: 'rails/activerecord-deprecated_finders'

gem 'sqlite3', group: :development

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sprockets-rails', github: 'rails/sprockets-rails'
  gem 'sass-rails',   github: 'rails/sass-rails'
  gem 'coffee-rails', github: 'rails/coffee-rails'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', platforms: :ruby

  gem 'uglifier', '>= 1.0.3'
  
  gem "font-awesome-sass-rails", git: "git://github.com/littlebtc/font-awesome-sass-rails.git"
end

group :development do
  gem "pry"
  gem 'better_errors'
  gem 'binding_of_caller'
end

gem 'jquery-rails'
gem 'jquery-turbolinks'
gem 'jquery-ui-rails', ">= 3.0.1"

gem "formtastic", github: "justinfrench/formtastic"
gem 'redcarpet'
gem 'md_preview'
gem "carrierwave"
gem "high_voltage", git: "git://github.com/thoughtbot/high_voltage.git"
gem "authlogic"

gem "acts-as-taggable-on", git: "git://github.com/tvdeyen/acts-as-taggable-on.git", branch: "rails4"

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.0.1'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

group :production do
	# Use unicorn as the app server
	gem 'unicorn'
	gem "fog", "~> 1.3.1"
	gem 'pg'
	gem 'rack-cache'
	gem 'dalli'
	gem 'newrelic_rpm'
end

# Deploy with Capistrano
# gem 'capistrano', group: :development

# To use debugger
# gem 'debugger'

gem 'workflow' # states for ideas
gem 'acts_as_votable', git: 'git://github.com/MichaelWhi/acts_as_votable.git', branch: 'rails4'
gem 'acts_as_commentable'
gem 'tweet-button', git: 'git://github.com/MichaelWhi/tweet-button.git'