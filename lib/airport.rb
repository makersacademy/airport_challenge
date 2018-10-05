require_relative 'plane'
class Airport
  def inialize(weather = 1)
    @weather = weather 
  end
  
  def land(plane)
    plane
  end
  
  def takeoff(plane)
    weather 
    fail 'Weather is too stormy to take off' unless @weather <= 4
    return plane, here?
  end
  
  def here?
    false
  end
  
  def weather 
    @weather = rand(1..5)
  end
end
