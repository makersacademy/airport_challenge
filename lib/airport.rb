require_relative 'weather'
class Airport
  include Weather
  DEFAULT_CAPACITY = 10
  attr_reader :planes
  def initialize
    @planes = []
  end

  def land(plane)
    fail 'Airport Full' if full?
    fail 'No Landing Due To Storm' if storm?
    plane.land
    planes << plane
    plane
  end

  def take_off
    fail 'No Take Off Due To Storm' if storm?
    plane = planes.pop
    plane.fly
  end

  def full?
    planes.length >= DEFAULT_CAPACITY
  end
end
