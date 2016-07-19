class Api::V1::CustomersSearchController < ApiBaseController
  respond_to :json, :xml

  def show
    if params[:first_name]
      respond_with Customer.where("lower(first_name) = ?", params[:first_name].downcase).first
    elsif params[:last_name]
      respond_with Customer.where("lower(last_name) = ?", params[:last_name].downcase).first
    else
      respond_with Customer.find_by(customer_params)
    end
  end

  def index
    if params[:first_name]
      respond_with Customer.where("lower(first_name) = ?", params[:first_name].downcase)
    elsif params[:last_name]
      respond_with Customer.where("lower(last_name) = ?", params[:last_name].downcase)
    else
      respond_with Customer.where(customer_params)
    end
  end

private

  def customer_params
    params.permit(:id, :first_name, :last_name, :created_at, :updated_at)
  end

end
