class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :title
      t.integer :year
      t.string :isbn
      t.string :author
      t.float :price
      t.string :category

      t.timestamps
    end
  end
end
