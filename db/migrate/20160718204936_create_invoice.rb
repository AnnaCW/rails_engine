class CreateInvoice < ActiveRecord::Migration[5.0]
  def change
    create_table :invoices do |t|
      t.string :status
    end
  end
end
