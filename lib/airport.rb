require_relative 'weather'

class Airport
  DEFAULT_CAPACITY = 20
  attr_reader :planes

  def initialize(weather, capacity = DEFAULT_CAPACITY)
    @weather = weather
    @capacity = capacity
    @planes = []
  end

  def land(plane)
    raise 'Plane is unable to land: airport is full' if full?
    raise 'Warning: Storm approaching, unable to land plane' if stormy?
    plane.land(self)
    add_plane(plane)
  end

  def takeoff(plane)
    raise 'Warning: Storm approaching, planes are unable to takeoff' if stormy?
    raise 'Cannot takeoff plane: plane is not at this airport' unless at_airport?(plane)
    plane.takeoff
    remove_plane(plane)
    return plane
  end

  private

  attr_reader :capacity, :weather

  def full?
    planes.length >= capacity
  end

  def stormy?
    weather.stormy?
  end

  def at_airport?(plane)
    planes.include?(plane)
  end

  def add_plane(plane)
    planes << plane
  end

  def remove_plane(plane)
    planes.pop
  end
end
