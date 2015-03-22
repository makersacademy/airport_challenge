class ControlTower
  def land_request plane, airport
    error_landing_full if airport.full?
    error_landing_stormy if stormy?
    puts 'CONTROL TOWER: Control Tower to Plane, cleared for landing'
    `say -v Kathy -r 190 "Control Tower to Plane, cleared for landing"`
    airport.park(plane)
  end

  def take_off_request plane, airport
    error_take_off_stormy if stormy?
    puts 'CONTROL TOWER: Control Tower to Plane, cleared for takeoff'
    `say -v Kathy -r 190 "Control Tower to Plane, cleared for take off"`
    airport.unpark(plane)
  end

  def error_landing_full
    `say -v Kathy -r 190 "Impossible to land, airport is Full"`
    fail 'CONTROL TOWER: Impossible to land, airport is Full'
  end

  def error_landing_stormy
    `say -v Kathy -r 190 "Impossible to land because of a storm"`
    fail 'CONTROL TOWER: Impossible to land because of a storm'
  end

  def error_take_off_stormy
    `say -v Kathy -r 190 "Impossible to take off because of a storm"`
    fail 'CONTROL TOWER: Impossible to take off because of a storm'
  end

  def stormy?
    [true, false, false, false, false].sample
  end
end
