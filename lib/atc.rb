#require_relative 'plane'

module ATC
  class Dummy_Class
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
   "Permission to land plane has been given. Your final task is to confirm that the plane has landed and the passengers have safetly reached their destination. To do this, please type 'plane.confirm_landing'."
  end

  def confirm_landing
    "The eagle has landed! Another plane is due to take-off. To complete your next task, create a new plane (plane = Plane.new('name') and type plane.prepare_take_off. Alternatively, try to land another plane by doing the same but typing plane.spotted."
  end

  def take_off_plane
    "Plane has been prepared for take-off. Your final job is to confirm that the plane is in the sky and the passengers are on route to their destination. Please type 'plane.confirm_take_off'."
  end

  def confirm_take_off
    "The eagle is flying! Please make more planes if you would like to keep going. To initiate the plane, activate either 'plane.spotted' and 'plane.prepare_take_off.'"
  end

  def cancel_take_off
    "plane cannot take off. Plane wil need to wait until data improves. Ascend another plane by typing (plane = Plane.new('name') and plane.prepare_take_off. Alternatively, try to land another plane by typing plane.spotted."
  end

  def cancel_landing
    "Landing has been cancelled. Plane will need to hover until data improves or land at another airport. Another plane is due to take-off. To complete your next task, create a new plane (plane = Plane.new('name') and type plane.prepare_take_off. Alternatively, try to land another plane by typing plane.spotted."
  end
end
end
