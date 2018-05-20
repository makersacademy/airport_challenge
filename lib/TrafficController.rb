class TrafficController
  def instruct_land(plane, airport)
    plane.land(airport)
    return [plane, airport]
  end
end
