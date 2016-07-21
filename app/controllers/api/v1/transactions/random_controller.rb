class Api::V1::Transactions::RandomController < ApiBaseController
  def index
    respond_with Transaction.order("RANDOM()").first
  end
end
