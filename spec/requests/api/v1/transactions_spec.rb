require 'rails_helper'

describe "Transactions Endpoint" do
  it "sends a list of transactions" do
    transactions = create_list(:transaction, 2)
    get "/api/v1/transactions"

    expect(response).to be_success

    parsed_transactions = JSON.parse(response.body)

    expect(parsed_transactions.count).to eq(2)
    expect(parsed_transactions).to be_an(Array)
    expect(parsed_transactions.first["result"]).to eq("success")
  end

  it "can return a single transaction" do
    transaction = create(:transaction)
    get "/api/v1/transactions/#{transaction.id}"

    expect(response).to be_success

    parsed_transaction = JSON.parse(response.body)

    expect(parsed_transaction["id"]).to eq(transaction.id)
  end

  it "can return a random transaction" do
    transactions = create_list(:transaction, 5)
    get "/api/v1/transactions/random"

    expect(response).to be_success

    parsed_transaction = JSON.parse(response.body)

    expect(parsed_transaction).to be_a(Hash)
    expect(parsed_transaction["credit_card_number"]).to_not be_nil
  end

  it "can find a transaction" do
    transactions = create_list(:transaction, 3, result: "success")
    get "/api/v1/transactions/find?result=success"

    expect(response).to be_success

    parsed_transaction = JSON.parse(response.body)

    expect(parsed_transaction).to be_a(Hash)
    expect(parsed_transaction["credit_card_number"]).to_not be_nil
  end

  it "can find all transactions" do
    target_transactions = create_list(:transaction, 2, result: "success")
    other_transactions = create_list(:transaction, 2, result: "failed")

    get "/api/v1/transactions/find_all?result=success"

    expect(response).to be_success

    parsed_transactions = JSON.parse(response.body)
    expect(parsed_transactions.count).to eq(2)
    expect(parsed_transactions.first["result"]).to eq("success")
  end
end
