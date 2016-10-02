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
    plane.confirm_land
    planes << plane
    planes.last # returns last plane that landed
  end

  def depart_plane(plane)
    fail "Plane cannot take off, it is too stormy." if stormy?
    fail "This plane has already taken off." if plane.landed? == false
    fail "This plane cannot depart from this airport." if planes.include?(plane) == false
    # plane.confirm_existence_in_airport(plane)
    plane.confirm_takeoff
    planes.delete(plane)
    planes
  end

  def list
    planes
  end

  private

  def correct_airport?
    true
  end

  def stormy?
    return true if rand(0..100) == 2
  end

  def full?
    planes.count >= capacity
  end
end
