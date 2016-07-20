class Api::V1::Invoices::SearchController < ApiBaseController
  respond_to :json, :xml

  def index
    if invoice_params[:id]
      respond_with Invoice.where("id = ?", invoice_params[:id])
    elsif invoice_params[:customer_id]
      respond_with Invoice.where("customer_id = ?", invoice_params[:customer_id])
    elsif invoice_params[:merchant_id]
      respond_with Invoice.where("merchant_id = ?", invoice_params[:merchant_id])
    elsif invoice_params[:created_at]
      respond_with Invoice.where("created_at = ?", invoice_params[:created_at])
    elsif invoice_params[:updated_at]
      respond_with Invoice.where("updated_at = ?", invoice_params[:updated_at])
    else
      respond_with Invoice.where(invoice_params)
    end
  end

  def show
    if invoice_params[:id]
      respond_with Invoice.find_by("id = ?", params[:id])
    elsif invoice_params[:customer_id]
      respond_with Invoice.find_by("customer_id = ?", params[:customer_id])
    elsif invoice_params[:merchant_id]
      respond_with Invoice.find_by("merchant_id = ?", params[:merchant_id])
    elsif invoice_params[:created_at]
      respond_with Invoice.find_by("created_at = ?", params[:created_at])
    elsif invoice_params[:updated_at]
      respond_with Invoice.find_by("updated_at = ?", params[:updated_at])
    else
      respond_with Invoice.find_by(invoice_params)
    end
  end


private

  def invoice_params
    params.permit(:id, :customer_id, :merchant_id, :created_at, :updated_at)
  end

end
