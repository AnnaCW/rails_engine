class Api::V1::Merchants::RevenueController < ApiBaseController
  respond_to :json, :xml

  def index
    respond_with ({"revenue" => Merchant.revenue_by_date(params["date"]) })
  end

  def show
    Merchant.find(params[:id]).revenue
  end

end
