require 'rails_helper'

RSpec.describe Merchant, type: :model do
  it { should have_many(:items) }
  it { should have_many(:invoices) }
  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name).ignoring_case_sensitivity }

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
end
