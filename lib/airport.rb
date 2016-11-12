require_relative 'plane.rb'

class Airport

DEFAULT_CAPACITY = 50

  attr_reader :planes, :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    fail "Airport is full" if full?
    plane.land
    @planes << plane
  end

  def take_off(plane)
    fail "Plane is not in airport" unless in_airport?(plane)
    plane.take_off
    @planes.delete(plane)
    plane
  end

  private

  def full?
    @planes.count >= capacity
  end

  def in_airport?(plane)
    @planes.include?(plane)
  end

end
