class Airport
  def land(plane)
    raise "Can't land: the weather is stormy" if stormyweather?
  end

  def takeoff(plane)
    raise "Can't take off: the weather is stormy" if stormyweather?
  end

  def stormyweather?
    (1..4).sample > 3
  end
end
