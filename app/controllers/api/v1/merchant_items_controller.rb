class Api::V1::MerchantItemsController < ApiBaseController
  respond_to :json, :xml

  def show
    respond_with Merchant.find(params[:id]).items
  end
end
