class CreateInvoiceItem < ActiveRecord::Migration[5.0]
  def change
    create_table :invoice_items do |t|
      t.integer :quantity
      t.decimal :unit_price
    end
  end
end
