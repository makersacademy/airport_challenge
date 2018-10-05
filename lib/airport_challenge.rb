class Airport
  def land(*)
    raise "Cannot land, weather is stormy." unless weather != "stormy"
    true
  end

  def take_off(*)
    raise "Cannot take off, weather is stormy." unless weather != "stormy"
    true
  end

  def check(*)
    false
  end

  def weather(weather = "sunny")
    weather
  end
end

class Plane
end
