class AddConditionToOffers < ActiveRecord::Migration[7.0]
  def change
    add_column :offers, :condition, :integer
  end
end
