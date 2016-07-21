class Api::V1::Invoices::InvoiceItemsController < ApiBaseController
  def index
    respond_with Invoice.find(params[:id]).invoice_items
  end
end
