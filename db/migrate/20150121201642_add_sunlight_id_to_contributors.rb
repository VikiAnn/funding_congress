class AddSunlightIdToContributors < ActiveRecord::Migration
  def change
    add_column :contributors, :sunlight_id, :integer
  end
end
