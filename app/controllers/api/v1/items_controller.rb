class Api::V1::ItemsController < ApiBaseController
  def index
    respond_with Item.all
  end

  def show
    respond_with Item.find(params[:id])
  end
end
