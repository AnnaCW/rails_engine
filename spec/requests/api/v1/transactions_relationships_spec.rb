require 'rails_helper'

describe "Transaction Relationships Endpoints" do
  it "can return the associated invoice" do
    invoice = create(:invoice, id: 88)
    transaction = create(:transaction, invoice: invoice)

    get "/api/v1/transactions/#{transaction.id}/invoice"

    expect(response).to be_success

    parsed_invoice = JSON.parse(response.body)

    expect(parsed_invoice["id"]).to eq(invoice.id)
  end
end
