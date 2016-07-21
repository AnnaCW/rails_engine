class Api::V1::Customers::FavoriteMerchantController < ApiBaseController
  def show
    respond_with Customer.find(params[:id]).favorite_merchant
  end
end
