class AttractionsController < ApplicationController

  def index
    @attractions = Attraction.all
    binding.pry
    find_user
  end

  def show
    find_user
    binding.pry
  end

  private

  def find_user
   if session.include? :user_id
     @user = User.find_by(session[:user_id])
   end
  end

end
