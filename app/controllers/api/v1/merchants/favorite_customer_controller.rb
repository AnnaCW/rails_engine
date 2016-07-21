class Api::V1::Merchants::FavoriteCustomerController < ApiBaseController
  respond_to :json, :xml

  def index
    respond_with Merchant.find(params[:id]).favorite_customer
  end
end
