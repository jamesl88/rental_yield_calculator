class AddYearlyYieldToLandlords < ActiveRecord::Migration
  def change
    add_column :landlords, :yearly_yield, :integer
  end
end
