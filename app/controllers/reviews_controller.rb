class ReviewsController < ApplicationController
  
  def new
    @review = current_customer.reviews.build
  end
  
  def create

   @review = current_customer.reviews.build(review_params)
   @review.bike_id = params[:bike_id]
    if @review.save
      redirect_to bike_path(@review)
    else
      render :new
    end
    
  end

  def destroy
    @review = Review.find_by(bike_id: params[:bike_id], customer_id: current_customer.id)
    @review.destroy
    redirect_back(fallback_location: root_path)
  end
  
   private
  def review_params
    params.require(:review). permit(:size, :height, :weight, :content)
  end
end
