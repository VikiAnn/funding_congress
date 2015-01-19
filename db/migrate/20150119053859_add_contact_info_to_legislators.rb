class AddContactInfoToLegislators < ActiveRecord::Migration
  def change
    add_column :legislators, :phone, :string
    add_column :legislators, :office, :string
    add_column :legislators, :website, :string
  end
end
