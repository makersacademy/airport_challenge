require_relative 'plane'
require_relative 'weather'

class Airport

  DEFAULT_CAPACITY = 2

  attr_reader :planes, :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
    @weather = Weather.new
  end

  def land(plane)
    fail "Airport full" if full?
    fail "Too stormy to land" if stormy?
    fail "Plane already landed" if in_airport?(plane)
    #fail "Plane landed in other airport" if plane_status?
    plane.landed
    @planes << plane
  end

  def take_off(plane)
    fail "Airport empty" if empty?
    fail "Too stormy to take off" if stormy?
    fail "Plane not at airport" unless in_airport?(plane)
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
    @weather.stormy?
  end

  def in_airport?(plane)
    @planes.include?(plane)
  end

end
