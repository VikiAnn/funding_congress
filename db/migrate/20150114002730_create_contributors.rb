class CreateContributors < ActiveRecord::Migration
  def change
    create_table :contributors do |t|
      t.string :name
      t.decimal :total_amount
      t.string :cycle
      t.references :legislator

      t.timestamps null: false
    end
  end
end
