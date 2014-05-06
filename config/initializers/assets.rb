# add all the css files from the original application
Rails.application.config.assets.precompile += %w( login.css )
Rails.application.config.assets.precompile += %w( profile.css )
Rails.application.config.assets.precompile += %w( navbar.css )
Rails.application.config.assets.precompile += %w( maps.css )
Rails.application.config.assets.precompile += %w( groups.css )
Rails.application.config.assets.precompile += %w( group_view.css )
Rails.application.config.assets.precompile += %w( bootstrap.min.css )


# add all the javascript files from the original application
Rails.application.config.assets.precompile += %w( groups.js )
Rails.application.config.assets.precompile += %w( login.js )
Rails.application.config.assets.precompile += %w( maps.js )
Rails.application.config.assets.precompile += %w( bootstrap.min.js )
Rails.application.config.assets.precompile += %w( jquery-1.9.0.min.js )


