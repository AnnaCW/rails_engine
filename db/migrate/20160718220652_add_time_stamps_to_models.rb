class AddTimeStampsToModels < ActiveRecord::Migration[5.0]
  def change
    add_column :customers, :created_at, :datetime
    add_column :customers, :updated_at, :datetime

    add_column :invoice_items, :created_at, :datetime
    add_column :invoice_items, :updated_at, :datetime

    add_column :invoices, :created_at, :datetime
    add_column :invoices, :updated_at, :datetime

    add_column :items, :created_at, :datetime
    add_column :items, :updated_at, :datetime

    add_column :merchants, :created_at, :datetime
    add_column :merchants, :updated_at, :datetime

    add_column :transactions, :created_at, :datetime
    add_column :transactions, :updated_at, :datetime
  end
end
