require 'rails_helper'

describe "Items BI Endpoints" do
  it "returns the x most sold items ranked by number sold" do
    items = create_list(:item, 3)
    get "/api/v1/items/most_items?quantity=x"

    expect(response).to be_success
  end

  it "returns best day for item" do
    item = create(:item)
    get "/api/v1/items/#{item.id}/best_day"

    expect(response).to be_success
    
  end

end
