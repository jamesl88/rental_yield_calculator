class AddNetYieldAndMaintenanceExpensesToLandlords < ActiveRecord::Migration
  def change
    add_column :landlords, :net_yield, :integer
    add_column :landlords, :maintenance_expenses, :integer
  end
end
