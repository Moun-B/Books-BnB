class AddDescriptionAndCoverurlToBooks < ActiveRecord::Migration[7.0]
  def change
    add_column :books, :description, :text
    add_column :books, :cover_url, :string
  end
end
