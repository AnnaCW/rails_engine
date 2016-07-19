class Api::V1::MerchantsSearchController < ApiBaseController
  respond_to :json, :xml

  def index
    if params[:name]
      respond_with Merchant.where("lower(name) = ?", params[:name].downcase)
    elsif params[:id]
      respond_with Merchant.find(params[:id])
    else
      respond_with Merchant.where(merchant_params)
    end
  end

  def show
    if params[:name]
      respond_with Merchant.where("lower(name) = ?", params[:name].downcase).first
    elsif params[:id]
      respond_with Merchant.find(params[:id])
    else
      respond_with Merchant.find_by(merchant_params)
    end
  end

private

  def merchant_params
    params.permit(:id, :name, :created_at, :updated_at)
  end
end
