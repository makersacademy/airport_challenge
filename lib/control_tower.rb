class ControlTower
  
  def land(plane, airport)
    plane.flying = false
    report(plane, airport)
  end
  
  def take_off(plane, airport)
    plane.flying = true
    report(plane, airport)
  end
  
  private
  
  def report(plane, airport)
    
    if plane.flying == false    #plane names had to be added               
      "Unit 737-1 has successfully landed in #{airport.name}" 
    else
      "Unit 737-1 has successfully taken-off from #{airport.name}"
   end
  end
  
end