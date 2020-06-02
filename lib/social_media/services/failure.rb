module SocialMedia
  module Services
    class Failure
      attr_reader :error

      def call(error)
        yield(error)
      end

    end
  end
end