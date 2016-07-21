class Api::V1::Items::SearchController < ApiBaseController
  def index
    respond_with Item.where(item_params)
  end

  def show
    if params[:unit_price]
      respond_with Item.where(unit_price: (params[:unit_price].to_f * 100).round).first
    else
      respond_with Item.where(item_params).first
    end
  end

private

  def item_params
    params.permit(:id, :name, :description, :unit_price, :merchant_id, :created_at, :updated_at)
  end
end
