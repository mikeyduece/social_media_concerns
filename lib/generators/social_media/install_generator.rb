require 'rails/generators'
require 'rails/generators/migration'

module SocialMedia
  class InstallGenerator < Rails::Generators::Base
    source_root File.expand_path('../templates', __FILE__ )

    def copy_migrations
      puts set_color('Copying SocialMedia migrations...', :cyan)
      rails_command('social_media:install:migrations')
    end

    def include_modules_in_owner_class
      content = social_media_modules
      class_path = if namespaced?
                     owner_class.to_s.split('::')
                   else
                     [owner_class]
                   end

      indent_depth = class_path.size - 1
      content = content.split("\n").map { |line| "  " * indent_depth + line }.join("\n") << "\n"

      inject_into_class(class_path, content, after: "class #{owner_class} < ApplicationRecord")
    end

    private

    def owner_class
      SocialMedia.owner_class
    end

    def social_media_modules
      <<~RUBY
        include SocialMedia::Concerns::Likeable
      RUBY
    end
  end
end