require_relative 'plane'

class Airport
attr_reader :planes_in_airport, :capacity

  def initialize
    @planes_in_airport = []
    @capacity = 20
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
    plane.plane_takes_off
    @planes_in_airport.delete(plane)
  end

  private

  def full?
    @planes_in_airport.length >= @capacity
  end

end
