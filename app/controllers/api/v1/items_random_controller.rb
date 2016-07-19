class Api::V1::ItemsRandomController < ApiBaseController
  respond_to :json, :xml

  def show
    respond_with Item.order("RANDOM()").first
  end
end
