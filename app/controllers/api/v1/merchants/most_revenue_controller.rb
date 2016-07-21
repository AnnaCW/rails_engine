class Api::V1::Merchants::MostRevenueController < ApiBaseController
  respond_to :json, :xml

  def index
    respond_with ({"merchants" => Merchant.most_revenue(params["quantity"]) })
  end
end
