class Api::V1::InvoiceItems::InvoiceController < ApiBaseController
  def index
    respond_with InvoiceItem.find(params[:id]).invoice
  end
end
