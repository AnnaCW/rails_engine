class Api::V1::TransactionsInvoiceController < ApiBaseController
  respond_to :json, :xml

  def show
    respond_with Transaction.find(params[:id]).invoice
  end
end
