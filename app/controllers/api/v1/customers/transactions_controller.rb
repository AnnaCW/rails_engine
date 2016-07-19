class Api::V1::Customers::TransactionsController < ApiBaseController
  respond_to :json, :xml

  def index
    respond_with Customer.find(params[:id]).transactions
  end
end
