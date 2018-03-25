class TrafficController
  def request_takeoff(airport)
     airport.allow_takeoff?
  end 

  def depart_airport(airplane)
    airplane.take_off
  end 
end 
