class RemoveColumnFromInvoiceItems < ActiveRecord::Migration[5.0]
  def change
    remove_column :invoice_items, :unit_price, :decimal
  end
end
