class Api::V1::InvoiceItemsSearchController < ApiBaseController
  respond_to :json, :xml

  def index
    if invoice_item_params[:id]
      respond_with InvoiceItem.where("id = ?", invoice_item_params[:id])
    elsif invoice_item_params[:quantity]
      respond_with InvoiceItem.where("quantity = ?", invoice_item_params[:quantity])
    elsif invoice_item_params[:unit_price]
      respond_with InvoiceItem.where("unit_price = ?", invoice_item_params[:unit_price])
    elsif invoice_item_params[:item_id]
      respond_with InvoiceItem.where("item_id = ?", invoice_item_params[:item_id])
    elsif invoice_item_params[:invoice_id]
      respond_with InvoiceItem.where("invoice_id = ?", invoice_item_params[:invoice_id])
    elsif invoice_item_params[:created_at]
      respond_with InvoiceItem.where("created_at = ?", invoice_item_params[:created_at])
    elsif invoice_item_params[:updated_at]
      respond_with InvoiceItem.where("updated_at = ?", invoice_item_params[:updated_at])
    else
      respond_with InvoiceItem.where(invoice_item_params)
    end
  end

  def show
    if invoice_item_params[:id]
      respond_with InvoiceItem.find_by(id: invoice_item_params[:id])
    elsif invoice_item_params[:quantity]
      respond_with InvoiceItem.find_by(quantity: invoice_item_params[:quantity])
    elsif invoice_item_params[:unit_price]
      respond_with InvoiceItem.find_by(unit_price: invoice_item_params[:unit_price])
    elsif invoice_item_params[:item_id]
      respond_with InvoiceItem.find_by(item_id: invoice_item_params[:item_id])
    elsif invoice_item_params[:invoice_id]
      respond_with InvoiceItem.find_by(invoice_id: invoice_item_params[:invoice_id])
    elsif invoice_item_params[:created_at]
      respond_with InvoiceItem.find_by(created_at: invoice_item_params[:created_at])
    elsif invoice_item_params[:updated_at]
      respond_with InvoiceItem.find_by(updated_at: invoice_item_params[:updated_at])
    else
      respond_with InvoiceItem.find_by(invoice_item_params)
    end
  end


private

  def invoice_item_params
    params.permit(:id, :quantity, :unit_price, :item_id, :invoice_id, :created_at, :updated_at)
  end

end
