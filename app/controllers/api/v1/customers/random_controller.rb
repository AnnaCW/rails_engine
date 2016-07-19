class Api::V1::Customers::RandomController < ApiBaseController
  respond_to :json, :xml

  def index
    respond_with Customer.order("RANDOM()").first
  end
end
