module Communicator

  def land(plane, airport)
    check_can_land(plane, airport)
    plane.landed_at(airport)
    airport.dock(plane)
  end

  def take_off(plane, airport)
    check_can_take_off(plane, airport)
    airport.undock(plane)
    plane.is_flying
  end

  private

  def check_can_land(plane, airport)
    fail "Can't land again" if plane.landed?
    fail "Can't land in stormy weather" if airport.weather == "stormy"
    fail "Can't land in full airport" if airport.full?
  end

  def check_can_take_off(plane, airport)
    fail "Can't take off when flying" if plane.flying?
    fail "Can't take off from another airport" if (plane.current_airport) != airport
    fail "Can't take off in stormy weather" if airport.weather == "stormy"
  end

end
