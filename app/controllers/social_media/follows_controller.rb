require 'social_media_concerns/services/follows/create'
require 'social_media_concerns/services/follows/destroy'

module SocialMediaConcerns
  class FollowsController < ApplicationController
    def create
      follow_service::Create.call(params) do |success, failure|
        success.call(&method(:object))
        failure.call(&method(:error))
      end
    end

    def destroy
      follow_service::Destroy.call(params) do |success, failure|
        success.call(&method(:object))
        failure.call(&method(:error))
      end
    end

    private

    def follow_service
      SocialMediaConcerns::Services::Follows
    end

  end
end