require_relative 'plane'
require_relative 'weather'

class Airport
  DEFAULT_CAPACITY = 20

  attr_reader :planes_in_airport, :capacity

  include Weather

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes_in_airport = []
    @capacity = capacity
  end

  def land(plane)

    fail "Plane is on the ground" unless plane.flying?
    fail "Airport is full" if full?
    fail "Too stormy to land" if stormy?
    plane.plane_lands
    planes_in_airport << plane
  end

  def take_off(plane)

    fail "Plane is in the air" if plane.flying?
    fail "Plane not in airport" unless plane_in_airport?(plane)
    fail "Too stormy to take off" if stormy?
    plane.plane_takes_off
    planes_in_airport.delete(plane)
  end

  private

#how to make planes_in_airport private and pass rspec tests

  def full?
    planes_in_airport.length >= @capacity
  end

  def plane_in_airport?(plane)
    planes_in_airport.include?(plane)
  end

end
