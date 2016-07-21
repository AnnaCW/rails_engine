class RevenueSerializer < ActiveModel::Serializer
  attribute :revenue

  def revenue
    revenue_string = object.to_s
    format_revenue(revenue_string).insert(-3, ".")
  end

  def format_revenue(string)
    if string.length == 2
      string = "00" + string
    elsif string.length == 1
      string = "000" + string
    end
    string
  end
end
