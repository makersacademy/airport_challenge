class AirTrafficController

  def initialize
  end  

  # I think the following two methods are too early to define
  # but keeping them in here for now    
  def land(_plane, _airport)
    # puts plane.airbourne? ? "Ok to land plane" : "Plane already grounded"
    result = "Plane landed successfully!"
    puts result
    return result
  end
  
  def take_off
    # puts !plane.airbourne? ? "Ready for take off" : "Plane already airbourne"
  end  
end
