class Api::V1::InvoiceItems::InvoiceController < ApiBaseController
  respond_to :json, :xml

  def index
    respond_with InvoiceItem.find(params[:id]).invoice
  end
end
