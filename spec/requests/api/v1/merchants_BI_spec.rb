require 'rails_helper'

describe "Merchants BI Endpoints" do
  it "returns total revenue for merchant" do
    merchant = create(:merchant)
    get "/api/v1/merchants/#{merchant.id}/revenue"

    expect(response).to be_success

  end

    it "returns revenue for merchant for given date" do
      merchant = create(:merchant)
      get "/api/v1/merchants/#{merchant.id}/revenue?date=x"

      expect(response).to be_success

    end

    it "returns x merchants ranked by items sold" do
      merchant = create(:merchant)
      get "/api/v1/merchants/most_items?quantity=x"

      expect(response).to be_success

    end

    it "returns a merchant's customers with pending invoices" do
      merchant = create(:merchant)
      customer = create(:customer)
      create_list(:invoice, 3, customer: customer, merchant: merchant,
                  status: "pending")

      get "/api/v1/merchants/#{merchant.id}/customers_with_pending_invoices"

      expect(response).to be_success

      parsed_customers = JSON.parse(response.body)

      expect(parsed_customers.count).to eq 3
    end

    it "returns a merchant's favorite customer" do
      merchant = create(:merchant)
      customer = create(:customer, :with_transactions, number_of: 3, merchant_id: merchant.id)
      favorite_customer = create(:customer, :with_transactions, number_of: 5, merchant_id: merchant.id)

      get "/api/v1/merchants/#{merchant.id}/favorite_customer"

      expect(response).to be_success

      parsed_customer = JSON.parse(response.body)

      expect(parsed_customer["first_name"]).to eq favorite_customer.first_name
      expect(parsed_customer["id"]).to eq favorite_customer.id
      expect(parsed_customer["last_name"]).to eq favorite_customer.last_name
    end

    it "returns total revenue for all merchants" do
      merchant_1 = create(:merchant)
      merchant_2 = create(:merchant)
      create(:customer, :with_transactions, merchant_id: merchant_1.id)
      create(:customer, :with_transactions, merchant_id: merchant_2.id)
      result = Merchant.revenue_by_date("2012-03-27T14:53:59.000Z")

      get "/api/v1/merchants/revenue?date=2012-03-27T14:53:59.000Z"

      expect(response).to be_success

      parsed_result = JSON.parse(response.body)

      expect(parsed_result["revenue"]).to eq result
    end
end
