class Api::V1::Invoices::TransactionsController < ApiBaseController
  def index
    respond_with Invoice.find(params[:id]).transactions
  end
end
