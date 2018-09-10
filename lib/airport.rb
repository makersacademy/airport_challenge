class Airport

  def land(plane)
    raise "Can't land: the weather is stormy" if stormyweather?
  end

  def takeoff(plane)
    raise "Can't take off: the weather is stormy" if stormyweather?
  end

  def stormyweather?
    rand(1..4) > 3
  end
end
