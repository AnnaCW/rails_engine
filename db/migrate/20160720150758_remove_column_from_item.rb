class RemoveColumnFromItem < ActiveRecord::Migration[5.0]
  def change
    remove_column :items, :unit_price, :decimal
  end
end
