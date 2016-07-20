require 'rails_helper'

describe "Merchants Endpoint" do
  it "sends a list of merchants" do
    merchants = create_list(:merchant, 2)
    get "/api/v1/merchants"

    expect(response).to be_success

    parsed_merchants = JSON.parse(response.body)

    expect(parsed_merchants.count).to eq(2)
    expect(parsed_merchants.first).to_not include("created_at")
    expect(parsed_merchants.first).to_not include("updated_at")
  end

  it "can return a single merchant" do
    merchant = create(:merchant)
    get "/api/v1/merchants/#{merchant.id}"

    expect(response).to be_success

    parsed_merchant = JSON.parse(response.body)

    expect(parsed_merchant["name"]).to eq(merchant.name)
    expect(parsed_merchant).to_not include("created_at")
    expect(parsed_merchant).to_not include("updated_at")
  end

  it "can return a random merchant" do
    merchant = create_list(:merchant, 5)
    get "/api/v1/merchants/random"

    expect(response).to be_success

    parsed_merchant = JSON.parse(response.body)

    expect(parsed_merchant).to be_a(Hash)
    expect(parsed_merchant["name"]).to_not be_nil
    expect(parsed_merchant).to_not include("created_at")
    expect(parsed_merchant).to_not include("updated_at")
  end

  it "can find a merchant" do
    merchants = create_list(:merchant, 2)
    target_merchant = create(:merchant, name: "Target")

    get "/api/v1/merchants/find?name=target"

    expect(response).to be_success

    parsed_merchant = JSON.parse(response.body)

    expect(parsed_merchant["name"]).to eq("Target")
    expect(parsed_merchant).to_not include("created_at")
    expect(parsed_merchant).to_not include("updated_at")
  end

  it "can find all merchants" do
    target_merchants = create_list(:merchant, 2, created_at: "2010-03-27T14:53:59.000Z")
    other_merchants = create_list(:merchant, 2)

    get "/api/v1/merchants/find_all?created_at=2010-03-27T14:53:59.000Z"

    expect(response).to be_success

    parsed_merchants = JSON.parse(response.body)

    expect(parsed_merchants.count).to eq(2)
    expect(parsed_merchants.first).to_not include("created_at")
    expect(parsed_merchants.first).to_not include("updated_at")
  end
end
