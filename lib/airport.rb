require_relative 'plane'
require_relative 'weather'

class Airport
  attr_reader :planes
  DEFAULT_CAPACITY = 20
  def initialize(weather = Weather.new, capacity = DEFAULT_CAPACITY)
    @weather = weather
    @capacity = capacity
    @planes = []
  end

  def land(plane)
    raise 'Airport is full to capacity' if full?
    raise 'Cannot land due to storm' if stormy?
    plane.land(self)
    add_plane(plane)
  end

  def takeoff(plane)
    raise 'Unable to take off in stormy weather' if stormy?
    raise 'Cannot take off plane, the plane is not at this airport' unless at_airport?(plane)
    plane.takeoff
    remove_plane(plane)
    plane
  end

  private

  attr_reader :capacity, :weather

  def full?
    planes.count >= capacity
  end

  def stormy?
    weather.stormy?
  end

  def at_airport?(plane)
    @planes.include?(plane)
  end

  def add_plane(plane)
    planes << plane
  end

  def remove_plane(plane)
    planes.delete(plane)
  end

end
