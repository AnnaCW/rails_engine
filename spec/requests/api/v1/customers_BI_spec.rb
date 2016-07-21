require 'rails_helper'

describe "Customers BI Endpoints" do
  it "returns favorite merchant for customer" do
    merchant = create(:merchant, name: "Bob")
    customer = create(:customer, :with_transactions, number_of: 5, merchant_id: merchant.id)

    get "/api/v1/customers/#{customer.id}/favorite_merchant"

    expect(response).to be_success
  
  end
end
