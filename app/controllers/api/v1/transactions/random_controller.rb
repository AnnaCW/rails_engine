class Api::V1::Transactions::RandomController < ApiBaseController
  respond_to :json, :xml

  def index
    respond_with Transaction.order("RANDOM()").first
  end
end
