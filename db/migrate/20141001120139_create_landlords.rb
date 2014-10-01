class CreateLandlords < ActiveRecord::Migration
  def change
    create_table :landlords do |t|
      t.string :email
      t.string :phone_number
      t.string :postcode
      t.integer :current_rent
      t.integer :property_price

      t.timestamps
    end
  end
end
