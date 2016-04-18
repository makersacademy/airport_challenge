require_relative 'plane'
require_relative 'weather'

class Airport

  DEFAULT_CAPACITY = 2

  attr_reader :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
    @weather = Weather.new
  end

  def land(plane)
    fail "Airport full" if full?
    fail "Too stormy to land" if stormy?
    fail "Plane already landed" if in_airport?(plane)
    plane.land
    planes << plane
  end

  def take_off(plane)
    fail "Airport empty" if empty?
    fail "Too stormy to take off" if stormy?
    fail "Plane not at airport" unless in_airport?(plane)
    plane.depart
    planes.delete(plane)
  end

  def empty?
    planes.empty?
  end

  def in_airport?(plane)
    planes.include?(plane)
  end

  private

  attr_reader :planes, :weather

  def full?
    planes.count >= capacity
  end

  def stormy?
    weather.stormy?
  end

end
