require_relative 'plane'
class Airport
  attr_reader :parked_planes
  attr_reader :capacity
  DEFAULT_CAPACITY = 10
  #run when new instance of airport is created
  def initialize(capacity = DEFAULT_CAPACITY)
    @parked_planes = []
    @capacity = capacity
  end
  #instruct a plane to land
  def land(plane)
    raise 'Plane has already landed' if parked_planes.any? { |all_planes| all_planes == plane }
    raise 'No parking spaces, DO NOT LAND' if parked_planes.count >= capacity
    plane.onGround
    parked_planes << plane
  end
  #instruct plane to takeoff
  def takeoff
    raise 'No Planes available for take off' if parked_planes.count == 0
    parked_planes.each do |plane|
      plane.inAir
      return parked_planes.shift
    end
  end
end
