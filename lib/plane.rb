class Plane

  def land(airport)
    raise if airport.weather == "Stormy"
    raise if airport.full? == true
    true
  end

  def takeoff(airport)
    raise if airport.weather == "Stormy"
    "Plane taken off" 
  end

end
