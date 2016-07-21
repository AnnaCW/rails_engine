require 'rails_helper'

RSpec.describe Item, type: :model do
  it { should belong_to (:merchant) }
  it { should have_many (:invoice_items) }
  it { should have_many (:invoices) }

  it "returns most-sold item" do
    item_1 = create(:item, id: 1)
    item_2 = create(:item, id: 2)
    item_3 = create(:item, id: 3)

    invoice_1, invoice_2, invoice_3, invoice_4 = create_list(:invoice, 4)

    invoice_item_1 = create(:invoice_item, invoice: invoice_1, item: item_1, quantity: 3)
    invoice_item_2 = create(:invoice_item, invoice: invoice_2, item: item_2, quantity: 5)
    invoice_item_3 = create(:invoice_item, invoice: invoice_3, item: item_3, quantity: 7)
    invoice_item_4 = create(:invoice_item, invoice: invoice_4, item: item_1, quantity: 1)

    expect(Item.most_items(3)).to eq([item_3, item_2, item_1])
    expect(Item.most_items(2)).to eq([item_3, item_2])
  end

  it "returns best day for item" do
    item = create(:item)
    invoice_1 = create(:invoice, created_at: "2015-03-27T14:53:59.000Z")
    invoice_2 = create(:invoice, created_at: "2014-03-27T14:53:59.000Z")
    invoice_3 = create(:invoice, created_at: "2013-03-27T14:53:59.000Z")

    invoice_item_1 = create(:invoice_item, invoice: invoice_1, item: item, quantity: 1)
    invoice_item_2 = create(:invoice_item, invoice: invoice_2, item: item, quantity: 1)
    invoice_item_3 = create(:invoice_item, invoice: invoice_3, item: item, quantity: 7)

    expect(item.best_day).to eq("2013-03-27T14:53:59.000Z")
  end


end
