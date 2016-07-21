class Api::V1::Merchants::RandomController < ApiBaseController
  def index
    respond_with Merchant.order("RANDOM()").first
  end
end
