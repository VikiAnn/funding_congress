class AddNullConstraintToSunlightId < ActiveRecord::Migration
  def change
    change_column_null :contributors, :sunlight_id, false
    change_column_null :legislators, :bioguide_id, false
    change_column_null :users, :uid, null: false
  end
end
