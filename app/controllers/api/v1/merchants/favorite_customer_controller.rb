class Api::V1::Merchants::FavoriteCustomerController < ApiBaseController
  def index
    respond_with Merchant.find(params[:id]).favorite_customer
  end
end
