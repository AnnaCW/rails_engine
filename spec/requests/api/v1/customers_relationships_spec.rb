require 'rails_helper'

describe "Customer Relationships Endpoints" do
  it "can return the associated invoices" do
    customer = create(:customer, id: 88)
    invoices = create_list(:invoice, 2, customer: customer)

    get "/api/v1/customers/#{customer.id}/invoices"

    expect(response).to be_success

    parsed_invoices = JSON.parse(response.body)

    expect(parsed_invoices.count).to eq(2)
  end

  it "can return the associated transactions" do
    customer = create(:customer, id: 88)
    invoice = create(:invoice, customer: customer)
    transactions = create_list(:transaction, 2, invoice: invoice)

    get "/api/v1/customers/#{customer.id}/transactions"

    expect(response).to be_success

    parsed_transactions = JSON.parse(response.body)

    expect(parsed_transactions.count).to eq(2)
  end
end
