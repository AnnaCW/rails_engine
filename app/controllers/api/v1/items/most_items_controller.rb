class Api::V1::Items::MostItemsController < ApiBaseController
  def index
    respond_with Item.most_items(params[:quantity].to_i)
  end
end
