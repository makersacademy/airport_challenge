class Airport
  attr_reader :planes

  def initialize(weather = Weather.new)
    @planes = []
    @weather = weather
  end

  def land(plane)
    raise "Can not land if the weather is stormy" if stormy?
    @planes << plane
  end

  def take_off(plane)
    raise "Can not take off if the weather is stormy" if stormy?
    @planes.delete(plane)
  end

  def stormy?
    @weather.stormy
  end
end
