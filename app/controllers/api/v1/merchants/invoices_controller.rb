class Api::V1::Merchants::InvoicesController < ApiBaseController
  def index
    respond_with Merchant.find(params[:id]).invoices
  end
end
