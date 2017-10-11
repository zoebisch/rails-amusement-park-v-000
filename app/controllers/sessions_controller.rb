class SessionsController < ApplicationController
  def new
  end

  def create
    if params[:user][:name] == nil || params[:user][:name] == ""
      redirect_to '/signin'
    else
      @user = User.find_by(:name => params[:user][:name])
      session[:user_id] = @user.id
      redirect_to users_show_path(@user)
    end
  end

  def destroy
    session.delete :user_id
    redirect_to '/'
  end

end
