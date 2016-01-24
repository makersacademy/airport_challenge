class ControlTower
  
  def land(plane, airport)
    airport.check_weather
    report(plane, airport)
  end
  
  def take_off(plane, airport)
    airport.check_weather
    report(plane, airport)
  end
  
  private
  
  def report(plane, airport)
    if airport.clear?
       if plane.flying == true    #plane names had to be added               
         plane.flying = false
        "737-1 landed in #{airport.name}"  
       else
         plane.flying = true
         "737-1 took-off from #{airport.name}"
      end
    else
      "Cannot operate, stormy weather"
    end
  end
  
end