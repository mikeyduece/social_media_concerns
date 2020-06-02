require 'social_media/services/likes/create'

module SocialMedia
  class LikesController < ApplicationController
    def create
      SocialMedia::Services::Likes::Create.call(params) do |success, failure|
        success.call(&method(:object))
        failure.call(&method(:error))
      end
    end

  end

end