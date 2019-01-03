require_relative 'weather'

class Airport
  def initialize(capacity, weather)
    @capacity = capacity
    @weather = weather
    @planes = []
  end

  def land(plane)
    raise 'Plane is unable to land: airport is full' if full?
    raise 'Warning: Storm approaching, unable to land plane' if stormy?
    @planes << plane
  end

  def takeoff(plane)
    raise 'Warning: Storm approaching, planes are unable to takeoff' if stormy?
    raise 'Cannot takeoff plane: plane is not at this airport' unless at_airport?(plane)
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
