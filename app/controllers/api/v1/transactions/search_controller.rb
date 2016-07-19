class Api::V1::Transactions::SearchController < ApiBaseController
  respond_to :json, :xml

  def index
    if params[:result]
      respond_with Transaction.where("lower(result)= ?", params[:result].downcase)
    elsif params[:id]
      respond_with Transaction.find(params[:id])
    else
      respond_with Transaction.where(transaction_params)
    end
  end

  def show
    if params[:result]
      respond_with Transaction.where("lower(result) = ?", params[:result].downcase).first
    elsif params[:id]
      respond_with Transaction.find(params[:id])
    else
      respond_with Transaction.find_by(transaction_params)
    end
  end

private

  def transaction_params
    params.permit(:id, :credit_card_number, :credit_card_expiration_date, :invoice_id, :result, :created_at, :updated_at)
  end

end
