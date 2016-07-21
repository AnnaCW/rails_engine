class Api::V1::Invoices::ItemsController < ApiBaseController
  def index
    respond_with Invoice.find(params[:id]).items
  end
end
