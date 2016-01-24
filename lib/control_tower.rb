class ControlTower
  
  
  def land(plane, airport)
    return "Cannot land in #{airport.name}, the airport is full" if airport.full?
    airport.check_weather
    return "Cannot operate in #{airport.name}, stormy weather" unless airport.clear?
    plane.flying = false
    airport.planes << plane
     "737-1 landed in #{airport.name}"   
  end
  
  def take_off(plane, airport)
    airport.check_weather
    return "Cannot operate in #{airport.name}, stormy weather" unless airport.clear?
    plane.flying = true
    airport.planes.delete(plane)
    "737-1 took-off from #{airport.name}"
  end
  
  
end