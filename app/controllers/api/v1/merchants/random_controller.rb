class Api::V1::Merchants::RandomController < ApiBaseController
  respond_to :json, :xml

  def index
    respond_with Merchant.order("RANDOM()").first
  end
end
