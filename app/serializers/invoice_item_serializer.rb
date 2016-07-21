class InvoiceItemSerializer < ActiveModel::Serializer
  attributes :id, :quantity, :unit_price, :invoice_id, :item_id

  def unit_price
    formatted_price = format_price(object.unit_price.to_s)
    formatted_price.insert(-3, ".")
  end

  def format_price(string)
    if string.length == 2
      string = "00" + string
    elsif string.length == 1
      string = "000" + string
    end
    string
  end
end
