class AddPriceToRentals < ActiveRecord::Migration[7.0]
  def change
    add_column :rentals, :price, :float
  end
end
