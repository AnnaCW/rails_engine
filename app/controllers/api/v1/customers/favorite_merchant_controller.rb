class Api::V1::Customers::FavoriteMerchantController < ApiBaseController
  respond_to :json, :xml

  def show
    respond_with Customer.find(params[:id]).favorite_merchant
  end

end
