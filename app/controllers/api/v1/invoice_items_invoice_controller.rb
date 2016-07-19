class Api::V1::InvoiceItemsInvoiceController < ApiBaseController
  respond_to :json, :xml

  def show
    respond_with InvoiceItem.find(params[:id]).invoice
  end
end
