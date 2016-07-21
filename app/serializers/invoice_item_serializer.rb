class InvoiceItemSerializer < ActiveModel::Serializer
  attributes :id, :quantity, :unit_price, :invoice_id, :item_id

  def unit_price
    "#{object.unit_price.to_s.insert(-3,".")}"
  end
end
