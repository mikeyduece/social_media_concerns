require_relative './base_follow_service'

module SocialMedia
  module Services
    module Follows
      class Create < BaseFollowService

        def call(&block)
          like = create_like

          yield(Success.new(like), NoTrigger)
        rescue ActiveRecord::NotFoundError, SocialMedia::Likes::AlreadyExistsError, StandardError => e
          yield(NoTrigger, Failure.new(e))
        end

        private

        def create_like
          owner.likeable_objects.create(target: target)
        end

      end
    end
  end
end