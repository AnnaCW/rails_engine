class Api::V1::Invoices::CustomerController < ApiBaseController
  def index
    respond_with Invoice.find(params[:id]).customer
  end
end
