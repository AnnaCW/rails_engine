class Merchant < ActiveRecord::Base
  validates :name, presence: true
  validates_uniqueness_of :name, :case_sensitive => false
  has_many :items
  has_many :invoices

  def customers_with_pending_invoices
    Customer.joins(:invoices).where(invoices: {status: "pending"})
  end
end
