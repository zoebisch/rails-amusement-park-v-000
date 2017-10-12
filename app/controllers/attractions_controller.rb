class AttractionsController < ApplicationController

  def new
      @attraction = Attraction.new
  end

  def edit
    @attraction = Attraction.find(params[:id])
  end

  def patch
    @attraction = Attraction.find(params[:id])
    @attraction.update(attractions_params)
  end

  def index
    @attractions = Attraction.all
    find_user
  end

  def show
    @attraction = Attraction.find(params[:id])
    find_user
  end

  def create
    @attraction = Attraction.create(attractions_params)
    redirect_to attraction_path(@attraction)
  end

  private

  def attractions_params
      params.require(:attraction).permit(:name, :tickets, :nausea_rating, :happiness_rating, :min_height)
  end


  def find_user
   if session.include? :user_id
     @user = User.find_by(session[:user_id])
   end
  end

end
