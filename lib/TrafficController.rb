class TrafficController

  # instruct a plane to land at a given airport 
  def instruct_land(plane, airport)
    plane.land(airport)
    return [plane, airport]
  end

end
