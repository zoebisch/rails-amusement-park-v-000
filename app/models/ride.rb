class Ride < ActiveRecord::Base
  # write associations here
  belongs_to :user
  belongs_to :attraction
  def take_ride
    attraction = Attraction.find(self.attraction_id)
    user = User.find(self.user_id)
    ride_check(user,attraction)
  end

  def ride_check(user,attraction)
    if user.height >= attraction.min_height && user.tickets >= attraction.tickets
      user.tickets -= attraction.tickets
      user.happiness += attraction.happiness_rating
      user.nausea += attraction.nausea_rating
      user.save
      "Thanks for riding the " + "#{attraction.name}!"
    elsif user.tickets < attraction.tickets && user.height < attraction.min_height
      "Sorry. You do not have enough tickets to ride the " + "#{attraction.name}. You are not tall enough to ride the #{attraction.name}."
    elsif user.tickets < attraction.tickets
      "Sorry. You do not have enough tickets to ride the " + "#{attraction.name}."
    else
      "Sorry. You are not tall enough to ride the " + "#{attraction.name}."
    end
  end
end
