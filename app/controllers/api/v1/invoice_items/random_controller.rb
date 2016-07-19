class Api::V1::InvoiceItems::RandomController < ApiBaseController
  respond_to :json, :xml

  def index
    respond_with InvoiceItem.order("RANDOM()").first
  end
end
