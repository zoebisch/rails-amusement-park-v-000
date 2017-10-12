module AttractionsHelper
  def new_check
    @user = User.find(session[:user_id])
    if @user.admin
      link_to "New Attraction", new_attraction_path
    end
  end

  def show_check(attraction)
    @user = User.find(session[:user_id])
    if @user.admin
      link_to "Show #{attraction.name}", attraction_path(attraction)
    else
      link_to "Go on " + attraction.name, attraction_path(attraction)
    end
  end

  def edit_check(attraction)
    @user = User.find(session[:user_id])
    if @user.admin
      link_to "Edit Attraction", edit_attraction_path(attraction)
    end
  end

end
