require 'rails_helper'

describe "Merchants BI Endpoints" do
  it "returns total revenue for merchant" do
    merchant = create(:merchant)
    invoice = create(:invoice, merchant: merchant)
    invoice.transactions << create(:transaction)
    create(:invoice_item, invoice: invoice, quantity: 2, unit_price: 3)


    get "/api/v1/merchants/#{merchant.id}/revenue"

    expect(response).to be_success

    parsed_response = JSON.parse(response.body)

    expect(parsed_response["revenue"]).to eq("00.06")
  end

    it "returns revenue for merchant for given date" do
      merchant = create(:merchant)
      invoice = create(:invoice, merchant: merchant, created_at: "2015-03-27T14:53:59.000Z")
      invoice.transactions << create(:transaction)
      create(:invoice_item, invoice: invoice, quantity: 2, unit_price: 3)

      get "/api/v1/merchants/#{merchant.id}/revenue?date=2015-03-27T14:53:59.000Z"

      expect(response).to be_success

       parsed_response = JSON.parse(response.body)

       expect(parsed_response["revenue"]).to eq("00.06")
    end

    it "returns x merchants ranked by items sold" do
      merchant_1 = create(:merchant, name: "Bob")
      merchant_2 = create(:merchant)
      item_1 = create(:item, merchant: merchant_1)
      item_2 = create(:item, merchant: merchant_2)
      invoice_1 = create(:invoice, merchant: merchant_1)
      invoice_2 = create(:invoice, merchant: merchant_2)
      invoice_1.transactions << create(:transaction)
      invoice_2.transactions << create(:transaction)
      invoice_item_1 = create(:invoice_item, invoice: invoice_1, item: item_1, quantity: 3)
      invoice_item_2 = create(:invoice_item, invoice: invoice_2, item: item_2, quantity: 1)

      get "/api/v1/merchants/most_items?quantity=2"

      expect(response).to be_success

      parsed_response = JSON.parse(response.body)

      expect(parsed_response.first["name"]).to eq("Bob")
    end

    it "returns a merchant's customers with pending invoices" do
      merchant = create(:merchant)
      customer_1 = create(:customer)
      customer_2 = create(:customer)
      invoice_1 = create(:invoice, customer: customer_1, merchant: merchant)
      invoice_2 = create(:invoice, customer: customer_2, merchant: merchant)
      invoice_1.transactions << create(:transaction, result: "failed")
      invoice_2.transactions << create(:transaction, result: "failed")

      get "/api/v1/merchants/#{merchant.id}/customers_with_pending_invoices"

      expect(response).to be_success

      parsed_customers = JSON.parse(response.body)

      expect(parsed_customers.count).to eq 2
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

      expect(parsed_result["total_revenue"]).to eq "100.00"
    end

    it "returns x merchants ranked by revenue" do
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

      get "/api/v1/merchants/most_revenue?quantity=3"

      expect(response).to be_success

      parsed_result = JSON.parse(response.body)

      expect(parsed_result.count).to eq 3
    end
end
