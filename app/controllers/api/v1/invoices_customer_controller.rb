class Api::V1::InvoicesCustomerController < ApiBaseController
  respond_to :json, :xml

  def show
    respond_with Invoice.find(params[:id]).customer
  end
end
