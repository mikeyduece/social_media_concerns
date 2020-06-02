module SocialMedia
  class Failure
    attr_reader :error

    def call(error)
      yield(error)
    end

  end
end