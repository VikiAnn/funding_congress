class AddZipcodeToLegislator < ActiveRecord::Migration
  def change
    add_column :legislators, :zipcode, :string
  end
end
