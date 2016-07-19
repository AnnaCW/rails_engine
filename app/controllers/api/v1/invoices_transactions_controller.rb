class Api::V1::InvoicesTransactionsController < ApiBaseController
  respond_to :json, :xml

  def index
    respond_with Invoice.find(params[:id]).transactions
  end
end
