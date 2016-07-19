class InvoiceItem < ActiveRecord::Base
  belongs_to :invoice
  belongs_to :item
  validates_presence_of :quantity
  validates_presence_of :unit_price
  validates_presence_of :invoice
  validates_presence_of :item
end
