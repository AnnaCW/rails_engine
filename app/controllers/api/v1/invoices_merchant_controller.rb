class Api::V1::InvoicesMerchantController < ApiBaseController
  respond_to :json, :xml

  def show
    respond_with Invoice.find(params[:id]).merchant
  end
end
