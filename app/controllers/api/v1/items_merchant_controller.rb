class Api::V1::ItemsMerchantController < ApiBaseController
  respond_to :json, :xml

  def show
    respond_with Item.find(params[:id]).merchant
  end
end
