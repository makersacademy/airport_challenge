require_relative 'plane'
require_relative 'weather'

class Airport

  DEFAULT_CAPACITY = 10

  attr_reader :planes, :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @weather = Weather.new
    @capacity = capacity.to_i
  end

  def land(plane)
    fail "Cannot land, the airport is full" if airport_full?
    fail 'Weather too stormy to land' if too_stormy?
    plane.landed
    planes << plane
  end

  def take_off(plane)
    fail 'Weather too stormy to take off' if too_stormy?
    fail 'Plane is not at this airport' if plane_not_present?(plane)
    plane.took_off
    planes.delete(plane)
  end

  private

  attr_reader :weather

  def plane_not_present?(plane)
    !planes.include?(plane)
  end

  def too_stormy?
    weather.stormy?
  end

  def airport_full?
    planes.size >= capacity
  end
end
