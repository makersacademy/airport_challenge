require_relative 'weather'

class Airport
  def initialize(capacity, weather)
    @capacity = capacity
    @weather = weather
    @planes = []
  end

  def land(plane)
    raise 'Cannot land: airport full' if full?
    raise 'Cannot land: stormy weather' if stormy?
    @planes << plane
  end

  def take_off(_plane)
    raise 'Cannot take off: stormy weather' if stormy?
  end

  private

  def full?
    @planes.length >= @capacity
  end

  def stormy?
    @weather.stormy?
  end
end
