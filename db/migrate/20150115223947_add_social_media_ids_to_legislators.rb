class AddSocialMediaIdsToLegislators < ActiveRecord::Migration
  def change
    add_column :legislators, :facebook_id, :string
    add_column :legislators, :twitter_id, :string
    add_column :legislators, :youtube_id, :string
  end
end
