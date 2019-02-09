class Plane
  def land(airport)
    airport.bad_weather_error
    if airport.is_full?
      raise "The airport is full."
    else
      airport.add_plane(self)
    end
  end

  def take_off(airport)
    airport.bad_weather_error
    airport.delete_plane(self)
  end

  def is_in?(airport)
    airport.planes.include?(self)?true:false
  end

end
