require_relative 'plane'
require_relative 'weather'

class Airport
DEFAULT_CAPACITY = 20
attr_reader :capacity
attr_reader :weather

  def initialize(cap = DEFAULT_CAPACITY)
    @capacity = cap
    @planes = []
    @weather = Weather.new
  end

  def land(plane)
    fail 'Airport is full' if full?
    fail 'Plane has already landed' if (planes.include?(plane))
    fail 'Cannot land in stormy weather' if weather.stormy?
    planes << plane
  end

  def take_off(plane)
    fail 'Plane is not at the airport' unless (planes.include?(plane))
    fail 'Cannot take off in stormy weather' if weather.stormy?
    planes.slice!(planes.index(plane))
  end

private

attr_reader :planes

  def full?
    planes.count >= capacity
  end

end
