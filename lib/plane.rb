class Plane

  def land_at(airport, weather)
    fail 'Landing not allowed due to stormy weather' if weather.stormy? == true
    fail 'Landing not permitted as airport is full' if airport.full? == true
    airport.land(self)
    true
  end

  def take_off_from(airport, weather)
    fail 'Take off not allowed due to stormy weather' if weather.stormy? == true
    fail 'Plane is not at the airport' if airport.contains?(self) == false
  end

  def taken_off?
    true
  end

end
