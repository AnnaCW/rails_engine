class ItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :unit_price, :merchant_id

  def unit_price
    formatted_price = format_price(object.unit_price.to_s)
    formatted_price.insert(-3, ".")
  end

  def format_price(string)
    if string.length == 2
      string += "00"
    elsif string.length == 1
      string += "000"
    end
    string
  end
end
