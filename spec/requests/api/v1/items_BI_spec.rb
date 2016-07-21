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
    invoice_1 = create(:invoice, created_at: "2015-03-27T14:53:59.000Z")
    invoice_2 = create(:invoice, created_at: "2014-03-27T14:53:59.000Z")
    invoice_3 = create(:invoice, created_at: "2013-03-27T14:53:59.000Z")

    invoice_item_1 = create(:invoice_item, invoice: invoice_1, item: item, quantity: 1)
    invoice_item_2 = create(:invoice_item, invoice: invoice_2, item: item, quantity: 1)
    invoice_item_3 = create(:invoice_item, invoice: invoice_3, item: item, quantity: 7)

    get "/api/v1/items/#{item.id}/best_day"

    expect(response).to be_success

    parsed_best_day = JSON.parse(response.body)

    expect(parsed_best_day["best_day"]).to eq("2013-03-27T14:53:59.000Z")
  end

end
