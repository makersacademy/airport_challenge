require_relative 'plane'
require_relative 'weather'

class Airport

attr_reader :planes_in_airport, :capacity
DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes_in_airport = []
    @capacity = capacity
  end

  def land(plane)
    fail "Plane is on the ground" unless plane.flying?
    fail "Airport is full" if full?
    plane.plane_lands
    @planes_in_airport << plane
  end

  def take_off(plane)
    fail "Plane is in the air" if plane.flying?
    fail "Plane not in airport" unless self.planes_in_airport.include?(plane)
    fail "Too stormy to take off" if self.stormy?
    plane.plane_takes_off
    @planes_in_airport.delete(plane)
  end

  private

  def full?
    @planes_in_airport.length >= @capacity
  end

end
