require_relative 'plane'
require_relative 'weather'


class Airport

attr_reader :planes
attr_reader :weather
attr_reader :capacity
DEFAULT_CAPACITY = 5

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @weather = Weather.new
    @capacity = capacity
  end

  def land(plane)
    fail "Storm" if self.stormy?
    fail "Full" if full?
    planes << plane
    plane.location = :airport
    planes
  end

  def take_off(plane)
    fail "Error: that plane isn't at this airport" unless planes.include? plane
    fail "Storm" if self.stormy?
    plane.location = :air
    planes.delete(plane)
  end

  def full?
    planes.count >= @capacity
  end

  def stormy?
    weather == :stormy
  end
end
