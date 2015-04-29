# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'
Rails.application.config.assets.precompile += %w( reset.css )
Rails.application.config.assets.precompile += %w( style.css )
Rails.application.config.assets.precompile += %w( positioning.css )
Rails.application.config.assets.precompile += %w( table_design.css )
Rails.application.config.assets.precompile += %w( pop_up_screen.css )
Rails.application.config.assets.precompile += %w( mobile_positioning.css )
Rails.application.config.assets.precompile += %w( events.js )
Rails.application.config.assets.precompile += %w( analytics.css)
Rails.application.config.assets.precompile += %w( image_positioning.css )
# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
