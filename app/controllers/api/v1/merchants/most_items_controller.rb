class Api::V1::Merchants::MostItemsController < ApiBaseController
  respond_to :json, :xml

  def index
    respond_with Merchant.most_items(params[:quantity].to_i)
  end

end
