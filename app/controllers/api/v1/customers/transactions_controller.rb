class Api::V1::Customers::TransactionsController < ApiBaseController
  def index
    respond_with Customer.find(params[:id]).transactions
  end
end
