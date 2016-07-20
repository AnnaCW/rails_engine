require 'rails_helper'

describe "Items Endpoint" do
  it "sends a list of items" do
    items = create_list(:item, 2)
    get "/api/v1/items"

    expect(response).to be_success

    parsed_items = JSON.parse(response.body)

    expect(parsed_items.count).to eq(2)
    expect(parsed_items.first).to_not include("created_at")
    expect(parsed_items.first).to_not include("updated_at")
  end

  it "can return a single item" do
    item = create(:item)
    get "/api/v1/items/#{item.id}"

    expect(response).to be_success

    parsed_item = JSON.parse(response.body)

    expect(parsed_item["id"]).to eq(item.id)
    expect(parsed_item).to_not include("created_at")
    expect(parsed_item).to_not include("updated_at")
  end

  it "can return a random items" do
    item = create_list(:item, 5)
    get "/api/v1/items/random"

    expect(response).to be_success

    parsed_item = JSON.parse(response.body)

    expect(parsed_item).to be_a(Hash)
    expect(parsed_item["id"]).to_not be_nil
  end

  it "can find a item" do
    items = create_list(:item, 2)
    target_item = create(:item, created_at: "2010-03-29T14:53:59.000Z")

    get "/api/v1/items/find?created_at=2010-03-29T14:53:59.000Z"

    expect(response).to be_success

    parsed_item = JSON.parse(response.body)

    expect(parsed_item["id"]).to eq target_item.id
  end

  it "can find all items" do
    target_items = create_list(:item, 2, created_at: "2010-03-29T14:53:59.000Z")
    other_items = create_list(:item, 2)

    get "/api/v1/items/find_all?created_at=2010-03-29T14:53:59.000Z"

    expect(response).to be_success

    parsed_items = JSON.parse(response.body)

    expect(parsed_items.count).to eq(2)
  end
end
