class Api::V1::Items::SearchController < ApiBaseController
  respond_to :json, :xml

  def index
    if item_params[:id]
      respond_with Item.where(id: item_params[:id])
    elsif item_params[:name]
      respond_with Item.where("lower(name) = ?", item_params[:name].downcase)
    elsif item_params[:description]
      respond_with Item.where("lower(description) = ?",item_params[:description].downcase)
    elsif item_params[:unit_price]
      respond_with Item.where(unit_price: item_params[:unit_price])
    elsif item_params[:merchant_id]
      respond_with Item.where(merchant_id: item_params[:merchant_id])
    elsif item_params[:created_at]
      respond_with Item.where(created_at: item_params[:created_at])
    elsif item_params[:updated_at]
      respond_with Item.where(updated_at: item_params[:created_at])
    else
      respond_with Item.where(merchant_params)
    end
  end

  def show
    if item_params[:id]
      respond_with Item.find_by(id: item_params[:id])
    elsif item_params[:name]
      respond_with Item.where("lower(name) = ?", item_params[:name].downcase).first
    elsif item_params[:description]
      respond_with Item.where("lower(description) = ?",item_params[:description].downcase).first
    elsif item_params[:unit_price]
      respond_with Item.find_by(unit_price: item_params[:unit_price])
    elsif item_params[:merchant_id]
      respond_with Item.find_by(merchant_id: item_params[:merchant_id])
    elsif item_params[:created_at]
      respond_with Item.find_by(created_at: item_params[:created_at])
    elsif item_params[:updated_at]
      respond_with Item.find_by(updated_at: item_params[:created_at])
    else
      respond_with Item.find_by(merchant_params)
    end
  end

private

  def item_params
    params.permit(:id, :name, :description, :unit_price, :merchant_id, :created_at, :updated_at)
  end
end
