class Controller

  def request_status(plane)
    return :inflight if plane.airport == :inflight
    :docked
  end

  def flight_approval(plane, weather)
    approval(weather)
    plane.acknowledge_flight_approval
  end

  def land_approval(plane, weather, airport)
    approval(weather)
    fail 'denied - no space at airport' if space?(airport)
    plane.acknowledge_land_approval(airport)
  end

  def space?(airport)
    airport.hangar.length >= airport.capacity
  end

  def approval(weather)
    fail "denied - weather is not sunny" if (weather != :sunny)
  end

end
