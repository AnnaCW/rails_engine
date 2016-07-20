class Api::V1::InvoiceItems::ItemController < ApiBaseController
  respond_to :json, :xml

  def index
    respond_with InvoiceItem.find(params[:id]).item
  end
end
