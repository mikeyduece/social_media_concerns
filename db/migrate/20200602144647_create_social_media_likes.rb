class CreateSocialMediaLikes < ActiveRecord::Migration[6.0]
  def change
    create_table :social_media_likes do |t|
      t.references :owner, polymorphic: true
      t.references :target, polymorphic: true

      t.timestamps
    end

    add_index :social_media_likes, %i[target_id target_type owner_id owner_type], unique: true, name: :idx_social_media_likes_on_owner_and_target
  end
end
