class Api::V1::InvoiceItems::ItemController < ApiBaseController
  def index
    respond_with InvoiceItem.find(params[:id]).item
  end
end
