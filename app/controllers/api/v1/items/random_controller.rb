class Api::V1::Items::RandomController < ApiBaseController
  def index
    respond_with Item.order("RANDOM()").first
  end
end
