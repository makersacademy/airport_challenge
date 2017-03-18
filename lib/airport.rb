require_relative 'plane'

class Airport
attr_reader :planes_in_airport

  def initialize
    @planes_in_airport = []
  end

  def land(plane)
    fail "Plane is on the ground" unless plane.flying?
    #plane.landed
    @planes_in_airport << plane
  end

  def take_off(plane)
    fail "Plane is in the air" if plane.flying?
    @planes_in_airport.delete(plane)
  end

end

#planes can only take off from airports they are in
