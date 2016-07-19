class Api::V1::Invoices::TransactionsController < ApiBaseController
  respond_to :json, :xml

  def index
    respond_with Invoice.find(params[:id]).transactions
  end
end
