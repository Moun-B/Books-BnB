class ChangeDataTypeForRentalsStatus < ActiveRecord::Migration[7.0]
  def change
    # change_table :rentals do |t|
    # end
    change_column(:rentals, :status, :integer, using: 'status::integer')
  end
end
