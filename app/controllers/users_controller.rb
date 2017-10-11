class UsersController < ApplicationController

  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    session[:user_id] = @user.id
    redirect_to users_show_path(@user)
  end

  def show
    if logged_in?
      @user = User.find(session[:user_id])
    else
      redirect_to '/'
    end

  end

  private

  def user_params
      params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :password, :admin )
  end

  def logged_in?
    session.include? :user_id
  end

end
