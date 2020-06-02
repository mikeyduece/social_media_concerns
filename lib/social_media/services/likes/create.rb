module SocialMedia
  module Likes
    class Create < BaseService

      def call(&block)
        like = create_like
        yield(Success.new(like), NoTrigger)
      rescue SocialMedia::Likes::AlreadyExistsError, StandardError => e
        yield(NoTrigger, e)
      end

      private

      def create_like
        user.likeable_objects.create(target: target)
      end

    end
  end
end