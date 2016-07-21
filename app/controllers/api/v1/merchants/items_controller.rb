class Api::V1::Merchants::ItemsController < ApiBaseController
  def index
    respond_with Merchant.find(params[:id]).items
  end
end
