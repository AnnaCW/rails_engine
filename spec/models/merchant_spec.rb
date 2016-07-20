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
    customer = create(:customer, :with_transactions, number_of: 3, merchant: merchant)
    favorite_customer = create(:customer, :with_transactions, number_of: 5, merchant: merchant)

    result = merchant.favorite_customer

    expect(result).to eq favorite_customer
  end
end
