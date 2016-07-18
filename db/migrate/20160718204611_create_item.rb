class CreateItem < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :name
      t.string :description
      t.decimal :unit_price
    end
  end
end
