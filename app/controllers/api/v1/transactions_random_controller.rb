class Api::V1::TransactionsRandomController < ApiBaseController
  respond_to :json, :xml

  def show
    respond_with Transaction.order("RANDOM()").first
  end
end
