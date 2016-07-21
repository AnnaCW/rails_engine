require 'rails_helper'

describe "Invoices Endpoint" do
  it "sends a list of customers" do
    invoices = create_list(:invoice, 2)
    get "/api/v1/invoices"

    expect(response).to be_success

    parsed_invoices = JSON.parse(response.body)

    expect(parsed_invoices.count).to eq(2)
    expect(parsed_invoices.first).to_not include("created_at")
    expect(parsed_invoices.first).to_not include("updated_at")
  end

  it "can return a single invoice" do
    invoice = create(:invoice)
    get "/api/v1/invoices/#{invoice.id}"

    expect(response).to be_success

    parsed_invoice = JSON.parse(response.body)

    expect(parsed_invoice["id"]).to eq(invoice.id)
    expect(parsed_invoice).to_not include("created_at")
    expect(parsed_invoice).to_not include("updated_at")
  end

  it "can return a random invoices" do
    invoice = create_list(:invoice, 5)
    get "/api/v1/invoices/random"

    expect(response).to be_success

    parsed_invoice = JSON.parse(response.body)

    expect(parsed_invoice).to be_a(Hash)
    expect(parsed_invoice["id"]).to_not be_nil
  end

  it "can find a invoice" do
    invoices = create_list(:invoice, 2)
    target_invoice = create(:invoice, created_at: "2010-03-29T14:53:59.000Z")

    get "/api/v1/invoices/find?created_at=2010-03-29T14:53:59.000Z"

    expect(response).to be_success

    parsed_invoice = JSON.parse(response.body)

    expect(parsed_invoice["id"]).to eq target_invoice.id
  end

  it "can find all invoices" do
    target_invoices = create_list(:invoice, 2, created_at: "2010-03-29T14:53:59.000Z")
    other_invoices = create_list(:invoice, 2)

    get "/api/v1/invoices/find_all?created_at=2010-03-29T14:53:59.000Z"

    expect(response).to be_success

    parsed_invoices = JSON.parse(response.body)

    expect(parsed_invoices.count).to eq(2)
  end
end
