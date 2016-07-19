class Api::V1::Items::InvoiceItemsController < ApiBaseController
  respond_to :json, :xml

  def index
    respond_with Item.find(params[:id]).invoice_items
  end
end
