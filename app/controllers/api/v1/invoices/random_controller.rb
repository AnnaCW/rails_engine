class Api::V1::Invoices::RandomController < ApiBaseController
  respond_to :json, :xml

  def index
    respond_with Invoice.order("RANDOM()").first
  end
end
