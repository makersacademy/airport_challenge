require 'plane.rb'

class Airport
attr_reader :planes
DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def instruct_plane_to_land(plane)
    raise 'Cannot land - airport is full' if is_full?
    raise 'Too stormy to land' if is_stormy?
    raise 'Cannot land - this plane is already on the ground' if plane.flying? == false
    plane.flying = false
    @planes << plane

  end

  def instruct_plane_to_take_off(plane)
    raise 'Cannot take off - this plane is not at the airport' if is_plane_at_airport?(plane) == false
    raise 'Too stormy to take off' if is_stormy?
    plane.flying = true
    @planes.delete_at(@planes.find_index(plane))
  end

private

  def is_stormy?
     rand(10) >= 8
  end

  def is_full?
    @planes.count >= @capacity
  end

  def is_plane_at_airport?(plane)
    @planes.include? plane
  end
end

airport = Airport.new
plane = Plane.new


