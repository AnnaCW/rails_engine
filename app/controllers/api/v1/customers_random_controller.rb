class Api::V1::CustomersRandomController < ApiBaseController
  respond_to :json, :xml

  def show
    respond_with Customer.order("RANDOM()").first
  end
end
