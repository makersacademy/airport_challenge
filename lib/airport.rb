require_relative 'plane'
class Airport
  attr_reader :parked_planes
  #run when new instance of airport is created
  def initialize
    @parked_planes = []
  end
  #instruct a plane to land
  def land(plane)
    raise 'Plane has already landed' if parked_planes.any? { |all_planes| all_planes == plane }
    plane.onGround
    parked_planes << plane
  end
  #instruct plane to takeoff
  def takeoff
    parked_planes.each do |plane|
      plane.inAir
      return parked_planes.shift
    end
  end
end
