class Airport
  attr_reader :planes

  def initialize(weather)
    @planes = []
    @weather = weather
  end

  def land(plane)
    @planes << plane
  end

  def take_off(plane)
    fail 'Unable to take off - weather is stormy' if @weather.stormy?
    @planes.delete(plane)
  end
end
