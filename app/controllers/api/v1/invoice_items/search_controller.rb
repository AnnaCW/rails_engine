class Api::V1::InvoiceItems::SearchController < ApiBaseController
  respond_to :json, :xml

  def index
    if params[:unit_price]
      respond_with InvoiceItem.where(unit_price: (params[:unit_price].to_f * 100).round)
    else
      respond_with InvoiceItem.where(invoice_item_params)
    end
  end

  def show
    if params[:unit_price]
      respond_with InvoiceItem.where(unit_price: (params[:unit_price].to_f * 100).round).first
    else
      respond_with InvoiceItem.find_by(invoice_item_params)
    end
  end


private

  def invoice_item_params
    params.permit(:id, :quantity, :unit_price, :item_id, :invoice_id, :created_at, :updated_at)
  end

end
