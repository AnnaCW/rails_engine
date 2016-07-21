require 'rails_helper'

describe "Items BI Endpoints" do
  it "returns the x most sold items ranked by number sold" do
    item_1 = create(:item, name: "Top")
    item_2 = create(:item)
    create(:invoice_item, item: item_1, quantity: 10)

    get "/api/v1/items/most_items?quantity=1"

    expect(response).to be_success

    parsed_response = JSON.parse(response.body)

    expect(parsed_response).to be_an(Array)
    expect(parsed_response.first["name"]).to eq("Top")
  end

  it "returns best day for item" do
    item = create(:item)
    get "/api/v1/items/#{item.id}/best_day"

    expect(response).to be_success

  end

end
