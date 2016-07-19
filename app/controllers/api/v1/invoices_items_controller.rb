class Api::V1::InvoicesItemsController < ApiBaseController
  respond_to :json, :xml

  def index
    respond_with Invoice.find(params[:id]).items
  end
end