class AddEmployeeAmountToContributor < ActiveRecord::Migration
  def change
    add_column :contributors, :employee_amount, :decimal
  end
end
