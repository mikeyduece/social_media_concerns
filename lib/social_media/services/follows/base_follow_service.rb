module SocialMedia
  module Services
    module Follows
      class BaseFollowService < BaseService
        private

        def followed_object
          followed_object = owner.followable_objects.find_by(target: target)
          if followed_object
            raise SocialMedia::Follows::AlreadyExistsError
            return
          end

          create_followed_object
        end

        def create_followed_object
          followed_object = owner.followable_objects.build(target: target)

          return followed_object if followed_object.save!
        end

        def destroy_followed_object
          return { destroyed: true } if followed_object.destroy!

          { destroyed: false }
        end

      end
    end
  end
end