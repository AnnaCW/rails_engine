class Api::V1::Merchants::RevenueController < ApiBaseController
  respond_to :json, :xml

  def index
    render json: Merchant.revenue_by_date(params["date"]), serializer: TotalRevenueSerializer
  end

  def show
    if params["date"]
      render json: Merchant.find(params[:id]).revenue_by_date(params["date"]), serializer: RevenueSerializer
    else
      render json: Merchant.find(params[:id]).revenue, serializer: RevenueSerializer
    end
  end

end
