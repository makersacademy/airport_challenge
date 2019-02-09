class Plane
  def land(airport)
    if airport.weather_conditions == "stormy"
      raise "The weather is stormy"
    else
      airport.add_plane(self)
    end
  end

  def take_off(airport)
    if airport.weather_conditions == "stormy"
      raise "The weather is stormy"
    else
      airport.delete_plane(self)
    end

  end

  def is_in?(airport)
    airport.planes.include?(self)?true:false
  end

end
