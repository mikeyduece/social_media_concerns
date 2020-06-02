require 'social_media/engine'
require 'social_media/concerns/likeable'
require 'social_media/services/likes/create'

module SocialMedia
  mattr_accessor :owner_class

  def self.owner_class
    @@owner_class.to_s.tilteize.constantize
  end
end
