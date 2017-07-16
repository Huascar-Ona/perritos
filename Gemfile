source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.1'
#Use devise
gem 'devise'
#Use omniauth-facebook (Facebook Authentication Gem)
gem 'omniauth-facebook'
#Use paperclip to manage images
gem 'paperclip'
#use aws-sdk 2.3 (amazon support)
gem 'aws-sdk', '~> 2.3'
# Use Puma as the app server
gem 'puma', '~> 3.0'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Call 'byebug' anywhere in the code to stop execution and get a debugger console
gem 'byebug'

#Simple form gem
gem 'simple_form'

#Client Side validations
gem 'client_side_validations'

#Plugin for client_side_validations and simple_form
gem 'client_side_validations-simple_form'

#gem pg for postgres as the database for Active Record
gem 'pg'

#Dropzone gem to upload multiple files with preview.
gem 'dropzonejs-rails'

#jquery-ui
gem 'jquery-ui-rails'

#lightbox2 image galery
gem 'lightbox2-rails', '~> 2.8.2.1'

#kaminari, this gem help us with the pagination
gem 'kaminari'

#awesome fonts, additional to bootstrap's glyphicons
gem 'font-awesome-rails'

#Used to manage the issues with google maps and the turbolinks.
gem 'jquery-turbolinks'

#Figaro serves as a enviroment variable management
gem 'figaro'

#rmagick
gem 'rmagick', require: 'RMagick'

#The assets that don't have a gem but it can be converted using rails-assets.org, generally used with bower.
source 'http://rails-assets.org' do
  gem 'rails-assets-angular'
  gem 'rails-assets-bootstrap'
  gem 'rails-assets-ngInfiniteScroll'
  gem 'rails-assets-angular-google-maps', '~> 2.3.1'
  gem 'rails-assets-lodash'
  gem 'rails-assets-angular-simple-logger'
  gem 'rails-assets-ngGeolocation'
  gem 'rails-assets-angular-route'
end


group :development, :test do
  # # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  # gem 'byebug', platform: :mri
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  #Use wdm (Windows Directory Monitor)
  gem 'wdm', platforms: [:mingw, :mswin, :x64_mingw]
  #Use certified gem to avoid problems with the ssl cert on localhost
  gem 'certified'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
