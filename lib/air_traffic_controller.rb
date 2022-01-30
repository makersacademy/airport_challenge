class AirTrafficController

  def initialize
  end  

  def land(plane, airport)
    # puts plane.airbourne? ? "Ok to land plane" : "Plane already grounded"
    if plane.airbourne? 
      if !airport.stormy_weather?
        result = "Plane landed successfully!"
      else
        result = "Stormy weather, so in holding queue!"
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
