class Merchant < ActiveRecord::Base
  has_many :items
  has_many :invoices
  has_many :customers, through: :invoices
  has_many :transactions, through: :invoices
  has_many :invoice_items, through: :invoices

  def customers_with_pending_invoices
    Customer.joins(merchants: :invoices)
            .where(merchants: {id: self.id})
            .merge(Invoice.joins(:transactions)
            .where(transactions: { result: 'failed' }))
            .distinct
  end

  def favorite_customer
    customers.joins(:transactions).where(transactions: {result: "success"})
             .group(:id)
             .order("COUNT(transactions) DESC").first
  end

  def self.revenue_by_date(date)
    Invoice.where(created_at: date).joins(:invoice_items)
            .sum('quantity * unit_price')
  end

  def self.most_revenue(num_results)
    Merchant.joins(:invoice_items).group(:id)
            .order('sum(quantity * unit_price) desc')
            .limit(num_results)
  end

  def merchant_items
    invoices.joins(:transactions, :invoice_items)
            .where(transactions: {result: "success"})
            .sum('quantity')
  end

  def self.most_items(num)
    Merchant.all.sort_by { |m| m.merchant_items }.reverse.take(num.to_i)
  end

  def revenue
    invoices.joins(:transactions, :invoice_items)
            .where(transactions: {result: "success"})
            .sum('quantity * unit_price')
  end

  def revenue_by_date(invoice_date)
    invoices.joins(:transactions, :invoice_items)
            .where(created_at: invoice_date, transactions: {result: "success"})
            .sum('quantity * unit_price')
  end
end
