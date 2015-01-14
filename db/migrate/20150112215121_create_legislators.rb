class CreateLegislators < ActiveRecord::Migration
  def change
    create_table :legislators do |t|
      t.string :bioguide_id
      t.boolean :in_office
      t.string :party
      t.string :first_name
      t.string :last_name
      t.string :middle_name
      t.string :nickname
      t.string :gender
      t.string :state
      t.string :title
      t.string :chamber

      t.timestamps null: false
    end
  end
end
