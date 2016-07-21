class Api::V1::Items::MerchantController < ApiBaseController
  def index
    respond_with Item.find(params[:id]).merchant
  end
end
