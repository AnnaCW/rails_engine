require 'rails_helper'

RSpec.describe Merchant, type: :model do
  it { should have_many(:items) }
  it { should have_many(:invoices) }

  it "Finds customers with pending invoices" do
    merchant = create(:merchant)
    customer = create(:customer)
    create_list(:invoice, 3, customer: customer, merchant: merchant,
                status: "pending")

    result = merchant.customers_with_pending_invoices

    expect(result.count).to eq 3
    expect(result[0].invoices[0].status).to eq "pending"
  end

  it "Finds the favorite customer" do
    merchant = create(:merchant)
    customer = create(:customer, :with_transactions, number_of: 3, merchant_id: merchant.id)
    favorite_customer = create(:customer, :with_transactions, number_of: 5, merchant_id: merchant.id)

    result = merchant.favorite_customer

    expect(result).to eq favorite_customer
  end

  it "Finds the total revenue for a date" do
    merchant_1 = create(:merchant)
    merchant_2 = create(:merchant)
    create(:customer, :with_transactions, merchant_id: merchant_1.id)
    create(:customer, :with_transactions, merchant_id: merchant_2.id)
    result = Merchant.revenue_by_date("2012-03-27T14:53:59.000Z")

    expect(result).to eq 10000
  end

  it "Finds the most revenue, with x number of given results" do
    merchant_1 = create(:merchant)
    merchant_2 = create(:merchant)
    customer_1 = create(:customer, :with_transactions, merchant_id: merchant_1.id)
    customer_2 = create(:customer, :with_transactions, merchant_id: merchant_2.id)
    extra_invoice = create(:invoice, merchant: merchant_1)
    extra_invoice.invoice_items << create(:invoice_item)
    customer_2.invoices << extra_invoice

    one_result = Merchant.most_revenue(1)
    multiple_results = Merchant.most_revenue(2)

    expect(one_result).to eq [merchant_1]
    expect(multiple_results).to eq [merchant_1, merchant_2]
  end

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

  it "returns x merchants ranked by number of items sold" do
    merchant_1, merchant_2, merchant_3 = create_list(:merchant, 3)
    invoice_1 = create(:invoice, merchant: merchant_1)
    invoice_2 = create(:invoice, merchant: merchant_2)
    invoice_3 = create(:invoice, merchant: merchant_3)
    item_1a = create(:item, merchant: merchant_1)
    item_1b = create(:item, merchant: merchant_1)
    item_2 = create(:item, merchant: merchant_2)
    item_3 = create(:item, merchant: merchant_3)
    invoice_item_1a = create(:invoice_item, invoice: invoice_1, item: item_1a, quantity: 3)
    invoice_item_1b = create(:invoice_item, invoice: invoice_1, item: item_1b, quantity: 4)
    invoice_item_2 = create(:invoice_item, invoice: invoice_2, item: item_2, quantity: 1)
    invoice_item_3 = create(:invoice_item, invoice: invoice_3, item: item_3, quantity: 8)

    expect(Merchant.most_items(3)).to eq([merchant_3, merchant_1, merchant_2])
  end
end
