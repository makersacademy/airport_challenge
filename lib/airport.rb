require_relative 'plane'

class Airport
  attr_reader :capacity, :plane, :airport

  DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @airport = []
  end

  def land_plane(plane)
    fail "It is too stormy to land!" if stormy?
    fail "Airport full, cannot land!" if full?
    fail "Plane already at the airport" if plane.at_airport?
    plane.land
    airport << plane
  end

  def take_off(plane)
    fail "It is too stormy to take off!" if stormy?
    fail "Plane not at the airport" unless plane.at_airport?
    plane.take_off
    remove_planes_taken_off
    "Take off was a success"
  end

  def stormy?
    rand_weather_condition < 3
  end

  def rand_weather_condition
    rand(10)
  end

  def full?
    airport.count >= capacity
  end

  def remove_planes_taken_off
    airport.delete_if { |plane| !plane.at_airport? }
  end

end
