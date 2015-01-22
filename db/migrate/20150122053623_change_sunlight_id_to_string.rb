class ChangeSunlightIdToString < ActiveRecord::Migration
  def up
    change_column :contributors, :sunlight_id, :string
  end

  def down
    change_column :contributors, :sunlight_id, :integer
  end
end
