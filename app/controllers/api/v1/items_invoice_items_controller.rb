class Api::V1::ItemsInvoiceItemsController < ApiBaseController
  respond_to :json, :xml

  def index
    respond_with Item.find(params[:id]).invoice_items
  end
end
