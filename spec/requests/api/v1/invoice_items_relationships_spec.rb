require 'rails_helper'

describe "Invoice Item Relationships Endpoints" do
  it "can return the associated invoice" do
    invoice = create(:invoice, id: 88)
    invoice_item = create(:invoice_item, invoice: invoice)

    get "/api/v1/invoice_items/#{invoice_item.id}/invoice"

    expect(response).to be_success

    parsed_invoice = JSON.parse(response.body)

    expect(parsed_invoice["id"]).to eq(88)
  end

  it "can return the associated item" do
    item = create(:item, name: "best thing")
    invoice_item = create(:invoice_item, item: item)

    get "/api/v1/invoice_items/#{invoice_item.id}/item"

    expect(response).to be_success

    parsed_item = JSON.parse(response.body)

    expect(parsed_item["name"]).to eq("best thing")
  end
end
