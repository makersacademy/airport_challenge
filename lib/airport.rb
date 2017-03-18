require_relative 'plane'

class Airport
attr_reader :planes_in_airport

  def initialize
    @planes_in_airport = []
  end

  def land(plane)
    fail "Plane is on the ground" unless plane.flying?
    plane.plane_lands
    @planes_in_airport << plane
  end

  def take_off(plane)
    fail "Plane is in the air" if plane.flying?
    fail "Plane not in airport" unless self.planes_in_airport.include?(plane)
    plane.plane_takes_off
    @planes_in_airport.delete(plane)
  end

end

#planes can only take off from airports they are in
