class AddDirectAmountToContributors < ActiveRecord::Migration
  def change
    add_column :contributors, :direct_amount, :decimal
  end
end
