class Plane
  def land(airport)
    airport.add_plane(self)
  end

  def take_off(airport)
    if airport.weather_conditions == "stormy"
      raise "The weather is stormy"
    else
      airport.planes.delete(self)
    end

  end

  def is_in?(airport)
    airport.planes.include?(self)?true:false
  end

end
