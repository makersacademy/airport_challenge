require_relative 'plane'

class Airport

  attr_accessor :planes, :capacity

  DEFAULT_CAPACITY = 20

  def initialize(capacity=DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def check_plane_status(plane)
    @planes.include?(plane) ? "Plane in airport" : "Plane not in airport"
  end

  def cleared_for_takeoff(plane)
    fail "It's too stormy to take off." if stormy?
    true
  end

  def cleared_for_landing(plane)
    fail "The airport is full." if full?
    fail "It's too stormy to land." if stormy?
    true
  end

  def full?
    @planes.length >= @capacity
  end

  def stormy?
    rand(10) >= 7
  end

end
