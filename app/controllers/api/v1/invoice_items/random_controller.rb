class Api::V1::InvoiceItems::RandomController < ApiBaseController
  def index
    respond_with InvoiceItem.order("RANDOM()").first
  end
end
