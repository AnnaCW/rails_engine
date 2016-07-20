require 'rails_helper'

describe "Invoice Relationships Endpoints" do
  it "can return customer" do
    customer = create(:customer, first_name: "Anna")
    invoice = create(:invoice, customer: customer)
    get "/api/v1/invoices/#{invoice.id}/customer"

    expect(response).to be_success

    parsed_customer = JSON.parse(response.body)

    expect(parsed_customer["first_name"]).to eq("Anna")
  end

  it "can return invoice items" do
    target_invoice = create(:invoice)
    invoice_items = create_list(:invoice_item, 5, invoice: target_invoice)
    other_invoice_item = create(:invoice_item)

    get "/api/v1/invoices/#{target_invoice.id}/invoice_items"

    expect(response).to be_success

    parsed_invoice_items = JSON.parse(response.body)

    expect(parsed_invoice_items.count).to eq(5)
    expect(parsed_invoice_items.first["invoice_id"]).to eq(target_invoice.id)
  end

  it "can return items" do
    invoice = create(:invoice)
    item_1, item_2 = create_list(:item, 2)
    invoice_item_1 = create(:invoice_item, invoice: invoice, item: item_1)
    invoice_item_2 = create(:invoice_item, invoice: invoice, item: item_2)

    get "/api/v1/invoices/#{invoice.id}/items"

    expect(response).to be_success

    parsed_items = JSON.parse(response.body)

    expect(parsed_items.count).to eq(2)
    expect(parsed_items.first["name"]).to eq(item_1.name)
  end

  it "can return merchant" do
    merchant = create(:merchant, name: "Bob")
    invoice = create(:invoice, merchant: merchant)
    get "/api/v1/invoices/#{invoice.id}/merchant"

    expect(response).to be_success

    parsed_merchant = JSON.parse(response.body)

    expect(parsed_merchant["name"]).to eq("Bob")
  end

  it "can return transactions" do
    invoice = create(:invoice)
    transactions = create_list(:transaction, 3, invoice: invoice)
    get "/api/v1/invoices/#{invoice.id}/transactions"

    expect(response).to be_success

    parsed_transactions = JSON.parse(response.body)

    expect(parsed_transactions.count).to eq(3)
  end
end
