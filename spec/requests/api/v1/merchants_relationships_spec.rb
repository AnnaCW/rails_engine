require 'rails_helper'

describe "Merchant Relationships Endpoints" do
  it "can return the associated items" do
    merchant = create(:merchant, id: 88)
    items = create_list(:item, 2, merchant: merchant)

    get "/api/v1/merchants/#{merchant.id}/items"

    expect(response).to be_success

    parsed_items = JSON.parse(response.body)

    expect(parsed_items.count).to eq(2)
  end

  it "can return the associated invoices" do
    merchant = create(:merchant, id: 88)
    invoices = create_list(:invoice, 2, merchant: merchant)

    get "/api/v1/merchants/#{merchant.id}/invoices"

    expect(response).to be_success

    parsed_invoices = JSON.parse(response.body)

    expect(parsed_invoices.count).to eq(2)
  end
end
