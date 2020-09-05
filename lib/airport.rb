require_relative "plane"
require_relative "weather"

class Airport
  include Weather
  attr_reader :capacity
  DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def request_landing(plane)
    fail "Airport is at capacity" if at_capacity?
    fail "Weather is stormy, unsuitable for landing" if stormy?
    @planes << plane
  end

  def request_take_off(plane)
    deleted_plane = @planes.delete(plane)
    fail "Plane was not located at this airport" if deleted_plane.nil?
    fail "Weather is stormy, unsuitable for take off" if stormy?
  end

  private

  def at_capacity?
    @planes.length >= @capacity
  end
end

def stormy?
  self.generate_weather == "stormy"
end
