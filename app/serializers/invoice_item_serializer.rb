class InvoiceItemSerializer < ActiveModel::Serializer
  attributes :id, :quantity, :unit_price, :invoice_id, :item_id

  def unit_price
    final_string = object.unit_price.to_s

    if final_string.length == 3
      final_string += "0"
    elsif final_string == 2
      final_string += "00"
    end

    final_string
  end
end
