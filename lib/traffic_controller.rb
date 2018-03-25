class TrafficController
  def request_takeoff(airport)
    airport.allow_takeoff?
  end 

  def request_landing(airport)
    airport.allow_landing?
  end 
  
  def make_landing(airplane, airport)
    raise 'cannot land at this airport' unless request_landing(airport)
    airport.add_plane(airplane)
    airplane.land_airplane
  end

  def leave_airort(airplane, airport)
    raise 'cannot take off from this airport' unless request_takeoff(airport)
    airport.remove_plane(airplane)
    airplane.take_off
  end 

  def depart_airport(airplane)
    airplane.take_off
  end
end 
