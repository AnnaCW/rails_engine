class Merchant < ActiveRecord::Base
  validates :name, presence: true
  validates_uniqueness_of :name, :case_sensitive => false
  has_many :items
  has_many :invoices
  has_many :customers, through: :invoices
  has_many :transactions, through: :invoices
  has_many :invoice_items, through: :invoices

  def customers_with_pending_invoices
    customers.where(invoices: {status: "pending"})
  end

  def favorite_customer
    customers.joins(:transactions).where(transactions: {result: "success"})
             .group(:id)
             .order("COUNT(transactions) DESC").first
  end

  def self.revenue_by_date(date)
    Merchant.joins(:invoice_items).where(created_at: date)
            .sum('quantity * unit_price')
  end

  def self.most_revenue(num_results)
    Merchant.joins(:invoice_items).group(:id)
            .order('sum(quantity * unit_price) desc')
            .limit(num_results)
  end

  def self.most_items(num)
    Merchant.joins(:invoice_items).group('merchants.id').order('sum(invoice_items.quantity) desc').limit(num)
  end

  def revenue
    invoices.joins(:invoice_items).sum('quantity * unit_price')
  end

  def revenue_by_date(invoice_date)
    invoices.joins(:invoice_items).where(created_at: invoice_date).sum('quantity * unit_price')
  end
end
