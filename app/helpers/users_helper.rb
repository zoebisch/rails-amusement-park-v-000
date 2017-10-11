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

end
