require_relative 'plane.rb'

class Airport

  attr_accessor :capacity

  CHANCE_OF_STORM = 0.1
  DEFAULT_CAPACITY = 200

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def land(plane)
    fail "Plane not in flight" if plane.on_ground
    fail "Can't land when stormy" if !good_weather?
    fail "Airport full" if full?
    plane.on_ground = true
    @planes << plane
  end

  def takeoff(plane)
    fail "Plane already in air" if !plane.on_ground
    fail "Can't takeoff when stormy" if !good_weather?
    fail "Plane not in airport" if !plane_in_airport?(plane)
    plane.on_ground = false
    @planes.delete(plane)
  end

  def add_new_plane(plane)
    fail "Plane already in airport" if plane_in_airport?(plane)
    fail "Plane already in air" if !plane.on_ground
    @planes << plane
  end

  def good_weather?
    rand() > Airport::CHANCE_OF_STORM
  end

  def full?
    @planes.count >= @capacity
  end

  def plane_in_airport?(plane)
    @planes.include?(plane)
  end

  def find_plane(plane)
    fail "Plane not in airport" if !plane_in_airport?(plane)
    plane
  end

end
