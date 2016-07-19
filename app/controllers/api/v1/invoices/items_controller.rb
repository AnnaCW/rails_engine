class Api::V1::Invoices::ItemsController < ApiBaseController
  respond_to :json, :xml

  def index
    respond_with Invoice.find(params[:id]).items
  end
end
