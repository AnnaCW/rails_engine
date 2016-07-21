class Api::V1::Customers::RandomController < ApiBaseController
  def index
    respond_with Customer.order("RANDOM()").first
  end
end
