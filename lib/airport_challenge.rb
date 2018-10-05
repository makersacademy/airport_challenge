class Airport
  def land(*)
    if self.weather == "stormy"
      raise "Cannot land, weather is stormy."
    else
      true
    end
  end

  def take_off(*)
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
