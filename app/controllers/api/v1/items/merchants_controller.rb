class Api::V1::Items::MerchantController < ApiBaseController
  respond_to :json, :xml

  def index
    respond_with Item.find(params[:id]).merchant
  end
end
