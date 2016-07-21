class Api::V1::Invoices::SearchController < ApiBaseController
  def index
    respond_with Invoice.where(invoice_params)
  end

  def show
    respond_with Invoice.find_by(invoice_params)
  end


private

  def invoice_params
    params.permit(:id, :customer_id, :merchant_id, :created_at, :updated_at)
  end

end
