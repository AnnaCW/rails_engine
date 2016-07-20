require 'rails_helper'

describe "invoice_items Endpoint" do
  it "sends a list of invoice_items" do
    invoice_items = create_list(:invoice_item, 2)
    get "/api/v1/invoice_items"

    expect(response).to be_success

    parsed_invoice_items = JSON.parse(response.body)

    expect(parsed_invoice_items.count).to eq(2)
    expect(parsed_invoice_items.first).to_not include("created_at")
    expect(parsed_invoice_items.first).to_not include("updated_at")
  end

  it "can return a single invoice_item" do
    invoice_item = create(:invoice_item)
    get "/api/v1/invoice_items/#{invoice_item.id}"

    expect(response).to be_success

    parsed_invoice_item = JSON.parse(response.body)

    expect(parsed_invoice_item["id"]).to eq(invoice_item.id)
    expect(parsed_invoice_item).to_not include("created_at")
    expect(parsed_invoice_item).to_not include("updated_at")
  end

  it "can return a random invoice_item_items" do
    invoice_item = create_list(:invoice_item, 5)
    get "/api/v1/invoice_items/random"

    expect(response).to be_success

    parsed_invoice_item = JSON.parse(response.body)

    expect(parsed_invoice_item).to be_a(Hash)
    expect(parsed_invoice_item["id"]).to_not be_nil
  end

  it "can find a invoice_item" do
    invoice_items = create_list(:invoice_item, 2)
    target_invoice_item = create(:invoice_item, created_at: "2010-03-29T14:53:59.000Z")

    get "/api/v1/invoice_items/find?created_at=2010-03-29T14:53:59.000Z"

    expect(response).to be_success

    parsed_invoice_item = JSON.parse(response.body)

    expect(parsed_invoice_item["id"]).to eq target_invoice_item.id
  end

  it "can find all invoice_items" do
    target_invoice_items = create_list(:invoice_item, 2, created_at: "2010-03-29T14:53:59.000Z")
    other_invoice_items = create_list(:invoice_item, 2)

    get "/api/v1/invoice_items/find_all?created_at=2010-03-29T14:53:59.000Z"

    expect(response).to be_success

    parsed_invoice_items = JSON.parse(response.body)

    expect(parsed_invoice_items.count).to eq(2)
  end
end
