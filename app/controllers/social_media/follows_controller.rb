require 'social_media/services/follows/create'
require 'social_media/services/follows/destroy'

module SocialMedia
  class LikesController < ApplicationController
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
      SocialMedia::Services::Follows
    end

  end
end