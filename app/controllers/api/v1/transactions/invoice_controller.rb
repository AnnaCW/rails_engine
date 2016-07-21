class Api::V1::Transactions::InvoiceController < ApiBaseController
  def index
    respond_with Transaction.find(params[:id]).invoice
  end
end
