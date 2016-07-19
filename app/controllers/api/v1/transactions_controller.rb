class Api::V1::TransactionsController < ApiBaseController
  respond_to :json, :xml

  def index
    respond_with Transaction.all
  end

  def show
    respond_with Transaction.find(params[:id])
  end
end
