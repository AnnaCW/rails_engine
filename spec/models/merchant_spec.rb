require 'rails_helper'

RSpec.describe Merchant, type: :model do
  it { should have_many (:items) }
  it { should have_many (:invoices) }
  it { should validate_presence_of (:name) }
  it { should validate_uniqueness_of (:name) }

  it "returns total revenue for merchant" do
    merchant = create(:merchant)
    invoice_1, invoice_2 = create_list(:invoice, 2, merchant: merchant)
    invoice_item_1 = create(:invoice_item, invoice: invoice_1, quantity: 2, unit_price: 3)
    invoice_item_2 = create(:invoice_item, invoice: invoice_2, quantity: 1, unit_price: 2)

    other_merchant = create(:merchant)
    invoice_3 = create(:invoice, merchant: other_merchant)
    invoice_item_3 = create(:invoice_item, invoice: invoice_3, quantity: 2, unit_price: 3)

    expect(merchant.revenue).to eq(8)
  end

  it "returns revenue for merchant for given date" do
    merchant = create(:merchant)
    invoice_1, invoice_2 = create_list(:invoice, 2, merchant: merchant, created_at: "2012-03-27T14:53:59.000Z")
    invoice_item_1 = create(:invoice_item, invoice: invoice_1, quantity: 2, unit_price: 3)
    invoice_item_2 = create(:invoice_item, invoice: invoice_2, quantity: 1, unit_price: 2)
    invoice_3 = create(:invoice, merchant: merchant, created_at: "2015-03-27T14:53:59.000Z")
    invoice_item_3 = create(:invoice_item, invoice: invoice_3, quantity: 2, unit_price: 3)

    expect(merchant.revenue_by_date("2012-03-27T14:53:59.000Z")).to eq(8)
  end

end
