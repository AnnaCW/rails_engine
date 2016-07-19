class Transaction < ActiveRecord::Base
  belongs_to :invoice
  validates :credit_card_number, presence: true, uniqueness: true
  validates :credit_card_expiration_date, presence: true
  validates :result, presence: true
  validates :invoice_id, presence: true
end
