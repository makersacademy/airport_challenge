require_relative "plane"
class Airport
  
  def land(plane)
    
  end
  
  def weather(conditions)
    conditions = rand(1..2)
    if conditions == 1
      return "stormy"
    else 
      return "sunny"
    end
  end
  
  def takeoff(plane)
    Plane.new
    Airport.new
    if plane.flying?
      Plane.new.plane_in_air
    end
  end

  private 
  
  def stormy?
    airport.weather("stormy")
  end

end
