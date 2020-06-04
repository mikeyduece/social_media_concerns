require 'social_media/services/likes/create'

module SocialMedia
  class LikesController < ApplicationController
    def create
      like_service::Create.call(params) do |success, failure|
        success.call(&method(:object))
        failure.call(&method(:error))
      end
    end

    def destroy
      like_service::Destroy.call(params) do |success, failure|
        success.call(&method(:object))
        failure.call(&method(:error))
      end
    end

    private

    def like_service
      SocialMedia::Services::Likes
    end

  end

end