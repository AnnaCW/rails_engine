class Api::V1::Merchants::MostItemsController < ApiBaseController
  respond_to :json, :xml

  def index(num)
    Merchant.most_items(num)
  end

end
