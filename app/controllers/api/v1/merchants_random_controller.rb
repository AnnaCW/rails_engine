class Api::V1::MerchantsRandomController < ApiBaseController
  respond_to :json, :xml

  def show
    respond_with Merchant.order("RANDOM()").first
  end
end
