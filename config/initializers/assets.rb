# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
Rails.application.config.assets.precompile += %w(jquery-fileupload/jquery.iframe-transport.js)
Rails.application.config.assets.precompile += %w(jquery-fileupload/jquery.fileupload.js)
Rails.application.config.assets.precompile += %w(jquery-fileupload/jquery.fileupload-ui.js)
Rails.application.config.assets.precompile += %w(jquery-fileupload/vendor/jquery.ui.widget.js)
Rails.application.config.assets.precompile += %w(jquery-fileupload/vendor/load-image.all.min.js)
Rails.application.config.assets.precompile += %w(jquery-fileupload/vendor/canvas-to-blob.js)
Rails.application.config.assets.precompile += %w(jquery-fileupload/jquery.fileupload-process.js)
Rails.application.config.assets.precompile += %w(jquery-fileupload/jquery.fileupload-image.js)
Rails.application.config.assets.precompile += %w(jquery-fileupload/jquery.fileupload-validate.js)
