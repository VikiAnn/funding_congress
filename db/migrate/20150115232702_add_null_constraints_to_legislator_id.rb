class AddNullConstraintsToLegislatorId < ActiveRecord::Migration
  def change
    change_column_null :contributors, :legislator_id, false
  end
end
