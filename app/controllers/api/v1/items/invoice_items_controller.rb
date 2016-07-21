class Api::V1::Items::InvoiceItemsController < ApiBaseController
  def index
    respond_with Item.find(params[:id]).invoice_items
  end
end
