require 'rails_helper'

describe "Item Relationships Endpoints" do
  it "can return invoice items" do
    item = create(:item)
    other_item = create(:item)
    invoice_items = create_list(:invoice_item, 2, item: item)
    other_invoice_items = create_list(:invoice_item, 2, item: other_item)

    get "/api/v1/items/#{item.id}/invoice_items"

    expect(response).to be_success

    parsed_invoice_items = JSON.parse(response.body)

    expect(parsed_invoice_items.count).to eq(2)
  end

  it "can return the associated merchant" do
    merchant = create(:merchant, name: "Jane")
    item = create(:item, merchant: merchant)

    get "/api/v1/items/#{item.id}/merchant"

    expect(response).to be_success

    parsed_merchant = JSON.parse(response.body)

    expect(parsed_merchant["name"]).to eq("Jane")
  end
end
