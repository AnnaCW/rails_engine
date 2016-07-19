class Api::V1::InvoicesRandomController < ApiBaseController
  respond_to :json, :xml

  def show
    respond_with Invoice.order("RANDOM()").first
  end
end
