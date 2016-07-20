class Api::V1::Merchants::RevenueController < ApiBaseController
  respond_to :json, :xml

  def show
    Merchant.find(params[:id]).revenue
  end

end
