class Api::V1::CustomersInvoicesController < ApiBaseController
  respond_to :json, :xml

  def show
    respond_with Customer.find(params[:id]).invoices
  end
end
