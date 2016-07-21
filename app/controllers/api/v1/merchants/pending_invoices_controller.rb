class Api::V1::Merchants::PendingInvoicesController < ApiBaseController
  respond_to :json, :xml

  def index
    respond_with Merchant.find(params[:id]).customers_with_pending_invoices
  end

end
