require_relative '../base_service'

module SocialMediaConcerns
  module Services
    module Reports
      class Destroy < BaseService

        def call(&block)
          reported_object = destroy_reported_object

          yield(Success.new(reported_object), NoTrigger)
        rescue ActiveRecord::NotFoundError, StandardError => e
          yield(NoTrigger, Failure.new(e))
        end

        private

        def destroy_reported_object
          return { destroyed: true } if reported_object.destroy!

          { destroyed: false }
        end

      end
    end
  end
end