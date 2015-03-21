class ControlTower
  def land_request plane, airport
    fail 'CONTROL TOWER: Impossible to land, airport is Full' if airport.full?
    fail 'CONTROL TOWER: Impossible to land because of a storm' if stormy?
    puts 'CONTROL TOWER: Control Tower to Plane, cleared for landing'
    airport.park(plane)
  end

  def take_off_request plane, airport
    fail 'CONTROL TOWER: Impossible to take off because of a storm' if stormy?
    puts 'CONTROL TOWER: Control Tower to Plane, cleared takeoff'
    airport.unpark(plane)
  end

  def stormy?
    [true, false, false, false, false].sample
  end
end
