require 'social_media/services/reports/create'
require 'social_media/services/reports/destroy'

module SocialMedia
  class ReportsController < ApplicationController
    def create
      report_service::Create.call(params) do |success, failure|
        success.call(&method(:object))
        failure.call(&method(:error))
      end
    end

    def destroy
      report_service::Destroy.call(params) do |success, failure|
        success.call(&method(:object))
        failure.call(&method(:error))
      end
    end

    private

    def report_service
      SocialMedia::Services::Reports
    end

  end
end