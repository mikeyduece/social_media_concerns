require 'social_media/services/blocks/create'
require 'social_media/services/blocks/destroy'

module SocialMedia
  class BlocksController < ApplicationController
    def create
      block_service::Create.call(params) do |success, failure|
        success.call(&method(:object))
        failure.call(&method(:error))
      end
    end

    def destroy
      block_service::Destroy.call(params) do |success, failure|
        success.call(&method(:object))
        failure.call(&method(:error))
      end
    end

    private

    def block_service
      SocialMedia::Services::Blocks
    end

  end
end