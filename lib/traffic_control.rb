module TrafficControl
  def take_off_during_storm
    fail "Plane can not take off during a storm."
  end

  def landing_during_storm
    fail "Plane can not land during a storm."
  end

  def landing_when_airport_is_full
    fail "Plane can not land, the airport is full."
  end
end