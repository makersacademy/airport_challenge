require_relative 'plane'
require_relative 'weather'

class Airport
  attr_accessor :planes, :capacity
  Default_capacity = 5

  def initialize(capacity = Default_capacity)
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    fail "Already landed" if landed?(plane)
    fail "Too stormy to land" if stormy_weather?
    fail "Airport full! No space to land" if full?
    plane.landed = true
    @planes << plane
  end

  def take_off(plane)
    fail "Plane already flying" if landed?(plane) == false
    fail "Wrong airport!" if wrong_airport? (plane)
    fail "Too stormy for take off" if stormy_weather?
    plane.landed = false
    plane = @planes.pop
  end

  def landed?(plane)
    plane.landed
  end

  def wrong_airport?(plane)
    ! @planes.include?(plane)
  end

  def stormy_weather?
    Weather.new.stormy?
  end

  def full?
    @planes.length >= @capacity
  end
end
