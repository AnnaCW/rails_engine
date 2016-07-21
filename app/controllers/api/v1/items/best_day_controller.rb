class Api::V1::Items::BestDayController < ApiBaseController
  respond_to :json, :xml

  def show
    render json: Item.find(params[:id]).best_day, serializer: BestDaySerializer
  end

end
