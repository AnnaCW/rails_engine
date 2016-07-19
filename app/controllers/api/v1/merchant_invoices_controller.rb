class Api::V1::MerchantInvoicesController < ApiBaseController
  respond_to :json, :xml

  def show
    respond_with Merchant.find(params[:id]).invoices
  end
end
