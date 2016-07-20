class Merchant < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  has_many :items
  has_many :invoices
  has_many :invoice_items, through: :invoices

  def revenue
    invoices.joins(:invoice_items).sum('quantity * unit_price')
  end

  def revenue_by_date(invoice_date)
    invoices.joins(:invoice_items).where(created_at: invoice_date).sum('quantity * unit_price')
  end

  def self.most_items(num)
    Merchant.joins(:invoice_items).group('merchants.id').order('sum(invoice_items.quantity) desc').limit(num)
  end

end
