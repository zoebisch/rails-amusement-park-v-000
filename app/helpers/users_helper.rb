module UsersHelper

  def mood_level
    case @user.happiness
    when 1
      "sad"
    when 2
      "unhappy"
    when 3
      "happy"
    when 4
      "excited"
    when 5
      "OMG"
    end
  end

  def admin_check
    if @user.admin
      "ADMIN"
    end
  end

  def user_check(user,ride)
    if user.height >= ride.min_height && user.tickets >= ride.tickets
      user.tickets -= ride.tickets
      user.happiness = ride.happiness_rating
      user.save
      "Thanks for riding the " + "#{ride.name}!"
    elsif user.tickets < ride.tickets && user.height < ride.min_height
      "You are not tall enough to ride the " + "#{ride.name}" + "You do not have enough tickets to ride the " + "#{ride.name}"
    elsif user.tickets < ride.tickets
      "You do not have enough tickets to ride the " + "#{ride.name}"
    else
      "You are not tall enough to ride the " + "#{ride.name}"
    end
  end


end
