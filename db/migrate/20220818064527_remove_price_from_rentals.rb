class RemovePriceFromRentals < ActiveRecord::Migration[7.0]
  def change
    remove_column :rentals, :price, :float
  end
end
