class Api::V1::Merchants::RevenueController < ApiBaseController
  respond_to :json, :xml

  def index
    render json: Merchant.revenue_by_date(params["date"]), serializer: RevenueSerializer
  end

  def show
    render json: Merchant.find(params[:id]).revenue, serializer: RevenueSerializer
  end

end
