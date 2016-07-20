require 'rails_helper'

describe "Customers BI Endpoints" do
  it "returns favorite merchant for customer" do
    customer = create(:customer)
    get "/api/v1/customers/#{customer.id}/favorite_merchant"

    expect(response).to be_success
  end
end
