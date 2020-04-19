module ATC
  def confirm_weather_descent
    print "The weather today is currently "
    puts result = ["sunny", "sunny", "stormy", "sunny"].sample
    if result == "sunny"
      land_plane
    else
      cancel_landing
    end
  end

  def confirm_weather_ascent
    print "The weather today is currently "
    puts result = ["sunny", "sunny", "stormy", "sunny"].sample
    if result == "sunny"
      take_off_plane
    else
      cancel_take_off
    end
  end

  def land_plane
    puts "Permission to land plane has been given."
    puts "Your final task is to confirm that the plane has landed."
    "To do this, please type 'plane.confirm_landing'."
  end

  def confirm_landing
    puts "The eagle has landed! Another plane is due to take-off."
    puts "To complete your next task, create a new plane and type"
    puts "plane.prepare_take_off. Alternatively, try to land another plane by"
    "doing the same but typing plane.spotted."
  end

  def take_off_plane
    puts "Plane has been prepared for take-off. Your final job is to confirm"
    "the plane is in the sky. Please type 'plane.confirm_take_off'."
  end

  def confirm_take_off
    puts "The eagle is flying! Please make more planes if you see fit."
    "To initiate plane, activate 'plane.spotted' or 'plane.prepare_take_off.'"
  end

  def cancel_take_off
    puts "plane cannot take off - will need to wait until data improves."
    puts "Ascend another plane by typing (plane = Plane.new('name') and"
    puts "plane.prepare_take_off."
    "Alternatively, try to land another plane by typing plane.spotted."
  end

  def cancel_landing
    puts "Landing has been cancelled. Another plane is due to take-off."
    puts "To complete your next task, create a new plane"
    puts "(plane = Plane.new('name') and type plane.prepare_take_off."
    "Alternatively, try to land another plane by typing plane.spotted."
  end
end
