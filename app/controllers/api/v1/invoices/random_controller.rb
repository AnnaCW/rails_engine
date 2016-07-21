class Api::V1::Invoices::RandomController < ApiBaseController
  def index
    respond_with Invoice.order("RANDOM()").first
  end
end
