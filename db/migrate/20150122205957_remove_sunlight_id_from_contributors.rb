class RemoveSunlightIdFromContributors < ActiveRecord::Migration
  def up
    remove_column :contributors, :sunlight_id
  end
  
  def down
    add_column :contributors, :sunlight_id, :string, null: false
  end
end
