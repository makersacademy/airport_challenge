require_relative 'plane'
require_relative 'weather'

class Airport

  DEFAULT_CAPACITY = 2

  attr_reader :planes, :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def land(plane)
    fail "Airport full" if full?
    fail "Too stormy to land" if stormy?
    fail "Plane already landed" if @planes.include?(plane)
    plane.landed
    @planes << plane
  end

  def take_off(plane)
    fail "Airport empty" if empty?
    fail "Too stormy to take off" if stormy?
    fail "Plane not at airport" if @planes.include?(plane) == false
    plane.departed
    @planes.delete(plane)
  end

  private
  def full?
    @planes.count >= capacity
  end

  def empty?
    @planes.empty?
  end

  def stormy?
    rand(10) >= 7
  end

end
