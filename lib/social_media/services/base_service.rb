module SocialMedia
  class BaseService
    attr_reader :user, :params

    def self.call(user, params = nil, &block)
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

  end
end