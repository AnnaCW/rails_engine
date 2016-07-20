class Item < ActiveRecord::Base
  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, through: :invoice_items
  validates_presence_of :name
  validates_presence_of :description
  validates_presence_of :unit_price
  validates_presence_of :merchant

  def self.most_items(num)
    Item.joins(:invoice_items).group('items.id').order('sum(invoice_items.quantity) desc').limit(num)
  end

  # def best_day
  #   invoice_items.group('invoice_items.id').order('sum(invoice_items.quantity)').limit(1)
  # end

end
