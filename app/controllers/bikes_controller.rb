class BikesController < ApplicationController
  def index
    @bikes= Bike.all
        # 検索オブジェクト
    @search = Bike.ransack(params[:q])
    # 検索結果
    @bikes = @search.result
  end
  
  def show
    @bike = Bike.find(params[:id])
  end
  
  
end
