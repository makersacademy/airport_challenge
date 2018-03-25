class TrafficController
  def request_takeoff(airport)
     airport.allow_takeoff?
  end 

  def request_landing(airport)
    airport.allow_landing?
  end 

  def depart_airport(airplane)
    airplane.take_off
  end 
end 
