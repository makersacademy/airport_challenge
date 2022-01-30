class AirTrafficController

  def initialize
  end  

  def land(plane, airport)
    # puts plane.airbourne? ? "Ok to land plane" : "Plane already grounded"
    if plane.airbourne? 
      if !airport.stormy_weather?
        if airport.planes_list.length < airport.capacity
          result = "Plane landed successfully!"
        else
          result = "Destination airport is full, go to holding queue!"
        end    
      else
        result = "Stormy weather, go to holding queue!"
      end    
    else
      result = "Plane already grounded!"
    end 
    puts result
    return result 
  end
  
  def take_off
    # puts !plane.airbourne? ? "Ready for take off" : "Plane already airbourne"
  end  
end
