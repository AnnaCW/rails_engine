class Merchant < ActiveRecord::Base
  validates :name, presence: true
  validates_uniqueness_of :name, :case_sensitive => false
  has_many :items
  has_many :invoices
  has_many :customers, through: :invoices

  def customers_with_pending_invoices
    customers.where(invoices: {status: "pending"})
  end
end
