require 'rails/generators'

module SocialMedia
  class InstallGenerator < Rails::Generators::Base
    source_root File.expand_path('../templates', __FILE__ )

    def generate_initializer
      puts set_color('Creating SocialMedia initializer...', :cyan)
      template('initializer.rb', 'config/initializers/social_media.rb')
    end
  end
end