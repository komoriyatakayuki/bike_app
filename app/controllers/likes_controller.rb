class LikesController < ApplicationController
  def create
    @like = current_customer.likes.create(bike_id: params[:bike_id])
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @like = Like.find_by(bike_id: params[:bike_id], customer_id: current_customer.id)
    @like.destroy
    redirect_back(fallback_location: root_path)
  end
end
