class Airport
  def land(plane)
    true
  end

  def take_off(plane)
    if self.weather == "stormy"
      raise "Cannot take off, weather is stormy."
    else
      true
    end
  end

  def check(*)
    false
  end

  def weather
  end
end

class Plane
end
