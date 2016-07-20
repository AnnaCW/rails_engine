class Merchant < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  has_many :items
  has_many :invoices

  def revenue
    invoices.joins(:invoice_items).sum('quantity * unit_price')
  end

  def revenue_by_date(invoice_date)
    invoices.joins(:invoice_items).where(created_at: invoice_date).sum('quantity * unit_price')
  end
end
