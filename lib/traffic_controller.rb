require_relative   "plane.rb"
require_relative   "airport.rb"
require_relative   "weather.rb"

class Controller
  # returns false if the plane can't takeoff
  # raises a mistake if it is already flying
  # otherwise takeoffs the plane and changes his flight status to true
  def instruct_takeoff(plane, airport, weather = Weather.new)
    raise "The plane is already flying" if plane.status == true
    if weather.stormy
      raise "Due to adverse weather conditions an airpot is closed for takeoff"
    else
      airport.takeoff(plane)
      plane.status = true
      return true
    end
  end
  # returns false if the plane can't land
  # raises a mistake if it is already on the ground
  # otherwise lands the plane and changes his flight status to false
  def instruct_landing(plane, airport, weather = Weather.new)
    raise "The plane has already landed" if plane.status == false
    if weather.stormy
      raise "Due to adverse weather conditions an airpot is closed for landing"
    else
      airport.land(plane)
      plane.status = false
      return true
    end
  end

end
