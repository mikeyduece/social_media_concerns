module SocialMedia
  module Services
    class Success
      attr_reader :object

      def call(object)
        yield(object)
      end

    end
  end
end