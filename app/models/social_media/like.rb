module SocialMedia
  class Like < ApplicationRecord
    belongs_to :target, polymorphic: true
    belongs_to :owner, polymorphic: true

    after_commit :increment_number_of_likes, on: :create
    before_destroy :decrement_number_of_likes

    private

    def increment_number_of_likes
      raise_error_if_requried

      update_like_count(:+)
    end

    def decrement_number_of_likes
      raise_error_if_requried

      update_like_count(:-)
    end

    def update_like_count(operator)
      like_count = target.number_of_likes.send(operator, 1)

      target.update(number_of_likes: like_count)
    end

    private

    def raise_error_if_requried
      raise NotImplementedError.new('You must add a #number_of_likes column to the model you wish to "Like"') unless target.respond_to?(:number_of_likes)
    end
  end
end
