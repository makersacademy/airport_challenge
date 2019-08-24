class Plane

  def land_at(airport)
    true
  end

  def take_off_from(airport, weather)
    fail 'Take off not allowed due to stormy weather' if weather.stormy? == true
  end

  def taken_off?
    true
  end

end
