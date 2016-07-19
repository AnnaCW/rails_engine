class Api::V1::Merchants::ItemsController < ApiBaseController
  respond_to :json, :xml

  def index
    respond_with Merchant.find(params[:id]).items
  end
end
