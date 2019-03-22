require_relative 'weather'
require_relative 'plane'

class Airport
  attr_reader :planes
  attr_accessor :capacity
  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land_on_runway(plane)
    fail "Airport at capacity" if full?
    fail "Plane not told to land" unless plane.landing == true

    plane.landed
    planes << plane
  end

  def take_off_from_runway(plane)
    fail "Plane not told to take off" unless plane.take_off == true

    plane_position = planes.index(plane)
    plane = planes.slice!(plane_position)
    plane.taken_off
  end

  def full?
    planes.count >= capacity
  end

end
