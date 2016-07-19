class Api::V1::Items::RandomController < ApiBaseController
  respond_to :json, :xml

  def index
    respond_with Item.order("RANDOM()").first
  end
end
