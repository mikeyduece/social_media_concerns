require 'social_media_concerns/services/likes/create'
require 'social_media_concerns/services/likes/destroy'

module SocialMediaConcerns
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
      SocialMediaConcerns::Services::Likes
    end

  end
end