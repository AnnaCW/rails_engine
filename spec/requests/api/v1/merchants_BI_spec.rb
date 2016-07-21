require 'rails_helper'

describe "Merchants BI Endpoints" do
  it "returns total revenue for merchant" do
    merchant = create(:merchant)
    invoice = create(:invoice, merchant: merchant)
    create(:invoice_item, invoice: invoice, quantity: 2, unit_price: 3)


    get "/api/v1/merchants/#{merchant.id}/revenue"

    expect(response).to be_success

    parsed_response = JSON.parse(response.body)

    expect(parsed_response["revenue"]).to eq(6)
  end

    it "returns revenue for merchant for given date" do
      merchant = create(:merchant)
      invoice = create(:invoice, merchant: merchant, created_at: "2015-03-27T14:53:59.000Z")
      create(:invoice_item, invoice: invoice, quantity: 2, unit_price: 3)

      get "/api/v1/merchants/#{merchant.id}/revenue?date=2015-03-27T14:53:59.000Z"

      expect(response).to be_success

       parsed_response = JSON.parse(response.body)

       expect(parsed_response["revenue"]).to eq(6)
    end

    it "returns x merchants ranked by items sold" do
      merchant_1 = create(:merchant, name: "Bob")
      merchant_2 = create(:merchant)
      item_1 = create(:item, merchant: merchant_1)
      item_2 = create(:item, merchant: merchant_2)
      invoice_1 = create(:invoice, merchant: merchant_1)
      invoice_2 = create(:invoice, merchant: merchant_2)
      invoice_item_1 = create(:invoice_item, invoice: invoice_1, item: item_1, quantity: 3)
      invoice_item_2 = create(:invoice_item, invoice: invoice_2, item: item_2, quantity: 1)

      get "/api/v1/merchants/most_items?quantity=2"

      expect(response).to be_success

      parsed_response = JSON.parse(response.body)

      expect(parsed_response.first["name"]).to eq("Bob")
    end
end
