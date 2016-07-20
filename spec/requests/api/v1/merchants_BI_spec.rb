require 'rails_helper'

describe "Merchants BI Endpoints" do
  it "returns total revenue for merchant" do
    merchant = create(:merchant)
    get "/api/v1/merchants/#{merchant.id}/revenue"

    expect(response).to be_success

  end

    it "returns revenue for merchant for given date" do
      merchant = create(:merchant)
      get "/api/v1/merchants/#{merchant.id}/revenue?date=x"

      expect(response).to be_success

    end

    it "returns x merchants ranked by items sold" do
      merchant = create(:merchant)
      get "/api/v1/merchants/most_items?quantity=x"

      expect(response).to be_success

    end
    
end
