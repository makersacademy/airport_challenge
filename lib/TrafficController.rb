class TrafficController

  # instruct a plane to land at a given airport
  def instruct_land(plane, airport)
    if airport.clear_weather? == false
      raise "Can't land a plane in bad conditions"
    end
    plane.land(airport)
    return [plane, airport]
  end

  # instruct a plane to take off
  def instruct_take_off(plane)
    plane.take_off
    return true
  end

end
