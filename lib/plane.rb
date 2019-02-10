class Plane
  def land(airport)
    airport.bad_weather_error
    airport.airport_full
    airport.landed_before?(self)
    airport.add_plane(self)
  end

  def take_off(airport)
    airport.bad_weather_error
    airport.exists?(self)
    airport.delete_plane(self)
  end

  def in?(airport)
    airport.planes.include?(self)
  end

end
