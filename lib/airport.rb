require_relative 'plane'
require_relative 'weather_module'

class Airport
  include Weather

  attr_reader :planes, :capacity

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    fail 'Cannot land. Stormy weather.' if is_stormy?
    fail 'Cannot land. Plane has already landed.' if landed(plane)
    fail 'Cannot land. Airport is full.' if full?
    plane.landplane
    planes << plane
  end

  def takeoff(plane)
    fail 'Cannot instruct takeoff. Stormy weather.' if is_stormy?
    fail 'Cannot instruct takeoff. Plane is already flying.' if plane.flying
    fail 'Cannot takeoff. Plane is not in airport' if missing(plane)
    plane.takeoff_plane
    planes.delete(plane)
  end

  private

  def landed(plane)
    !plane.flying
  end

  def full?
    planes.size == capacity
  end

  def missing(plane)
    !planes.include?(plane)
  end

end
