require_relative 'plane'

class Airport
  attr_reader :planes, :capacity

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land_plane(plane)
    fail "Plane cannot land as airport is at capacity." if full?
    fail "Plane cannot land, it is too stormy." if stormy?
    fail "This plane has already landed." if plane.landed? == true
    if plane.confirm_land
      planes << plane
      planes.last # returns last plane that landed
    end
  end

  def depart_plane(plane)
    fail "Plane cannot take off, it is too stormy." if stormy?
    fail "This plane has already taken off." if plane.landed? == false
    if plane.confirm_takeoff
      remove_plane_from_list(plane)
    end
    planes
  end

  private

  def remove_plane_from_list(plane)
    planes.delete(plane)
  end

  def stormy?
    return true if rand(0..100) == 2
  end

  def full?
    planes.count >= capacity
  end
end
