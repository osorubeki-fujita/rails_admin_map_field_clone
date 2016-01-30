require 'rails'
require 'rails_admin_map_field'

module RailsAdminMapField
  class Engine < ::Rails::Engine

    # ::RailsAdmin::Engine.class_eval do
      # puts "::RailsAdmin::Engine: #{ self.name } (class_eval)"

      # initializer 'RailsAdminMapField add assets' do | app |
      #   app.config.assets.paths += Dir[ ::RailsAdminMapField::Engine.root.join('app', 'assets', 'stylesheets') ]
      #   app.config.assets.paths += Dir[ ::RailsAdminMapField::Engine.root.join('app', 'assets', 'javascripts') ]
      # end

      # initializer 'RailsAdminMapField precompile hook' do | app |
      #   app.config.assets.precompile += %w(
      #     rails_admin_map_field/index.js
      #     rails_admin_map_field/index.css
      #   )
      # end
    # end

  end
end
