class Item < ActiveRecord::Base
  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, through: :invoice_items

  def self.most_items(num)
    Item.joins(:invoice_items).group('items.id').order('sum(invoice_items.quantity) desc').limit(num)
  end

  # def best_day
  #   invoice_items.group('invoice_items.id').order('sum(invoice_items.quantity)').limit(1)
  # end

end
