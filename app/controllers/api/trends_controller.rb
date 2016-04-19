class Api::TrendsController < ApiController
  before_action :authenticate_user
  def index
    trends = Trend.all
    render json: trends, each_serializer: TrendSerializer
  end
  def create
    trend = Trend.new(trend_params)
    if trend.save
      render json: trend
    else
      render json: { errors: trend.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private
  def trend_params
    params.require(:trend).permit(:name, :user_id)
  end
end
