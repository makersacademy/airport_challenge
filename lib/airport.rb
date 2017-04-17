require './lib/plane.rb'
require './lib/weather.rb'

class Airport

  DEFAULT_CAPACITY = 25
  attr_accessor :planes, :capacity

  def initialize(capacity)
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    fail "The airport is full" if full?
    raise RuntimeError, "Landing cancelled due to stormy weather" if storm_outside?
    plane.land_plane
    planes << plane
  end

  def take_off(plane)
    fail "No planes available" if empty?
    raise RuntimeError, "Take off cancelled due to stormy weather" if storm_outside?
    plane.plane_take_off
    planes.pop
  end

  def empty?
    planes.empty?
  end

  def full?
    planes.count >= capacity
  end

  def storm_outside?
    :stormy?
  end

end
