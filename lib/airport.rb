class Airport
  def initialize
    @planes_landed = []
  end
  def land plane
    @planes_landed << plane
  end
  def take_off plane, weather
    raise "weather is too stormy for take off" if weather.stormy?
    @planes_landed.pop
  end
  def planes_landed
    @planes_landed
  end
end
