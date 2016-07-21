require 'rails_helper'

RSpec.describe Customer, type: :model do
  it { should have_many (:invoices) }
  it { should validate_presence_of (:first_name) }
  it { should validate_presence_of (:last_name) }

  it "returns favorite merchant" do
    merchant_1, merchant_2 = create_list(:merchant, 2)
    customer = create(:customer, :with_transactions, number_of: 5, merchant_id: merchant_2.id)

    expect(customer.favorite_merchant).to eq(merchant_2)
  end
end
