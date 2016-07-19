class Api::V1::CustomersTransactionsController < ApiBaseController
  respond_to :json, :xml

  def show
    respond_with Customer.find(params[:id]).transactions
  end
end
