module SocialMediaConcerns
  module Services
    class BaseService
      attr_reader :user, :params

      def self.call(params, &block)
        new(user, params).call(&block)
      end

      def initialize(user, params)
        @user = user
        @params = params
      end

      private_class_method :new

      def call(&block)
        raise NotImplementedError
      end

      private

      def target
        target = params[:target_type].constantize.find_by(id: params[:target_id])
        raise ActiveRecord::RecordNotFound unless target

        target
      end

      def owner
        owner = SocialMediaConcerns.owner_class.find_by(id: params[:owner_id])
        raise ActiveRecord::RecordNotFound unless owner

        owner
      end

    end
  end
end