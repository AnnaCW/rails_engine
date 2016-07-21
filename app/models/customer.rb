class Customer < ActiveRecord::Base
  has_many :invoices
  has_many :merchants, through: :invoices
  has_many :transactions, through: :invoices
  validates :first_name, presence: true
  validates :last_name, presence: true

  def favorite_merchant
    merchants.joins(:transactions).where(transactions: {result: "success"})
             .group(:id)
             .order("count(transactions) desc").first
  end

end

# def favorite_customer
#     customers.joins(:transactions).where(transactions: {result: "success"})
#              .group(:id)
#              .order("COUNT(transactions) DESC").first
#   end
