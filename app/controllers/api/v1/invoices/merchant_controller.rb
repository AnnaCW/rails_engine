class Api::V1::Invoices::MerchantController < ApiBaseController
  def index
    respond_with Invoice.find(params[:id]).merchant
  end
end
