require 'rails_helper'

describe "Customers Endpoint" do
  it "sends a list of customers" do
    customers = create_list(:customer, 2)
    get "/api/v1/customers"

    expect(response).to be_success

    parsed_customers = JSON.parse(response.body)

    expect(parsed_customers.count).to eq(2)
  end

  it "can return a single customer" do
    customer = create(:customer)
    get "/api/v1/customers/#{customer.id}"

    expect(response).to be_success

    parsed_customer = JSON.parse(response.body)

    expect(parsed_customer["first_name"]).to eq(customer.first_name)
  end

  it "can return a random customer" do
    customer = create_list(:customer, 5)
    get "/api/v1/customers/random"

    expect(response).to be_success

    parsed_customer = JSON.parse(response.body)

    expect(parsed_customer).to be_a(Hash)
    expect(parsed_customer["last_name"]).to_not be_nil
  end

  it "can find a customer" do
    customers = create_list(:customer, 2)
    target_customer = create(:customer, last_name: "lastname")

    get "/api/v1/customers/find?last_name=lastname"

    expect(response).to be_success

    parsed_customer = JSON.parse(response.body)

    expect(parsed_customer["last_name"]).to eq("lastname")
  end

  it "can find all customers" do
    target_customers = create_list(:customer, 2, created_at: "2010-03-27T14:53:59.000Z")
    other_customers = create_list(:customer, 2)

    get "/api/v1/customers/find_all?created_at=2010-03-27T14:53:59.000Z"

    expect(response).to be_success

    parsed_customers = JSON.parse(response.body)

    expect(parsed_customers.count).to eq(2)
  end
end
