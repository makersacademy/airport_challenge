class Plane
  def land(airport)
    airport.bad_weather_error
    airport.airport_full
    airport.has_landed_before?(self)
    airport.add_plane(self)
  end

  def take_off(airport)
    airport.bad_weather_error
    airport.exists?(self)
    airport.delete_plane(self)
  end

  def is_in?(airport)
    airport.planes.include?(self)?true:false
  end

end
