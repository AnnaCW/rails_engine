class Api::V1::Items::MostItemsController < ApiBaseController
  respond_to :json, :xml

  def index
    respond_with Item.most_items(params[:quantity].to_i)
  end

end
