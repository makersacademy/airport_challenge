class ControlTower
  
  
  def land(plane, airport)
    return "Cannot land in #{airport.name}, the airport is full" if airport.full?
    return "#{plane.plane_id} is not flying" if plane.flying == false
    airport.check_weather
    return "Cannot operate in #{airport.name}, stormy weather" unless airport.clear?
    plane.flying = false
    airport.planes << plane
     "737-1 landed in #{airport.name}"   
  end
  
  def take_off(plane, airport) 
    return "#{plane.plane_id} is not in #{airport.name}" unless airport.planes.include?(plane)
    airport.check_weather
    return "Cannot operate in #{airport.name}, stormy weather" unless airport.clear?
    plane.flying = true
    airport.planes.delete(plane)
    "737-1 took-off from #{airport.name}"
  end
  
  
end