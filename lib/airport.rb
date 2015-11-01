require 'weather'

class Airport

  DEFAULT_CAPACITY = 20

  def initialize(weather, capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @weather = weather
    @planes = []
  end

  def land(plane)
    raise 'Cannot land plane: airport full' if full?
    raise 'Cannot land plane: weather is stormy' if stormy?
    plane.land(self)
    @planes << plane
  end

  def take_off(plane)
    raise 'Cannot take off plane: weather is stormy' if stormy?
    raise 'Cannot take off plane: the plane is not at this airport' unless at_airport?(plane)
    plane.take_off
    plane
  end

  private

  def full?
    @planes.length >= @capacity
  end

  def stormy?
    @weather.stormy?
  end

  def at_airport?(plane)
    @planes.include?(plane)
  end

end
