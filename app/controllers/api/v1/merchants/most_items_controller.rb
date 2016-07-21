class Api::V1::Merchants::MostItemsController < ApiBaseController
  def index
    respond_with Merchant.most_items(params[:quantity].to_i)
  end

end
