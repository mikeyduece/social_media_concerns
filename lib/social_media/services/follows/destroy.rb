require './base_follow_service'

module SocialMedia
  module Services
    module Follows
      class Destroy < BaseFollowService

        def call(&block)
          followed_object = destroy_followed_object

          yield(Success.new(followed_object), NoTrigger)
        rescue ActiveRecord::NotFoundError, SocialMedia::Likes::AlreadyExistsError, StandardError => e
          yield(NoTrigger, Failure.new(e))
        end

      end
    end
  end
end