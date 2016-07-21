class Api::V1::Merchants::RevenueController < ApiBaseController
  respond_to :json, :xml

  def show
    respond_with ( {"revenue" => Merchant.find(params[:id]).revenue } )
  end

end
