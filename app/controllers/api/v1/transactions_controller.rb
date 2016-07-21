class Api::V1::TransactionsController < ApiBaseController
  def index
    respond_with Transaction.all
  end

  def show
    respond_with Transaction.find(params[:id])
  end
end
