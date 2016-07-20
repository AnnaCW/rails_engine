class Api::V1::Transactions::SearchController < ApiBaseController
  respond_to :json, :xml

  def index
    respond_with Transaction.where(transaction_params)
  end

  def show
    respond_with Transaction.find_by(transaction_params)
  end

private

  def transaction_params
    params.permit(:id, :credit_card_number, :credit_card_expiration_date, :invoice_id, :result, :created_at, :updated_at)
  end

end
