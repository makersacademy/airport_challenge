class ControlTower
  def land_request plane, airport
    fail 'Airport is Full' if airport.full?
    fail 'Impossible to land because of a storm' if stormy?
    airport.park(plane)
  end

  def take_off_request plane, airport
    fail 'Impossible to take off because of a storm' if stormy?
    airport.unpark(plane)
  end

  def stormy?
    [true, false, false, false, false].sample
  end
end
