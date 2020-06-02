module SocialMedia
  class Success
    attr_reader :object

    def call(object)
      yield(object)
    end
    
  end
end