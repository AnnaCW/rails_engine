class Api::V1::Merchants::PendingInvoicesController < ApiBaseController
  def index
    respond_with Merchant.find(params[:id]).customers_with_pending_invoices
  end
end
