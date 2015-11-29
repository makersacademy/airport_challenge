require_relative 'plane'
require_relative 'weather'

class Airport

  attr_reader :planes
  attr_reader :capacity

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land(plane, weather)
    fail 'Cannot land. Stormy weather.' if weather.is_stormy
    fail 'Cannot land. Plane has already landed.' if landed(plane)
    fail 'Cannot land. Airport is full.' if @planes.size == capacity
    plane.landplane
    @planes << plane
  end

  def takeoff(plane, weather)
    fail 'Cannot instruct takeoff. Stormy weather.' if weather.is_stormy
    fail 'Cannot instruct takeoff. Plane is already flying.' if plane.flying
    plane.takeoff_plane
    @planes.delete(plane)
  end


  private

  def landed(plane)
    !plane.flying
  end

end
