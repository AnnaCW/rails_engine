class Api::V1::InvoiceItemsRandomController < ApiBaseController
  respond_to :json, :xml

  def show
    respond_with InvoiceItem.order("RANDOM()").first
  end
end
