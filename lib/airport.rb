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
    plane.land_plane
    planes << plane
  end

  def take_off(plane)
    fail "No planes available" if empty?
    #fail "Take off cancelled due to stormy weather" if Weather::stormy
    plane.plane_take_off
    planes.pop
  end

  def empty?
    planes.empty?
  end

  def full?
    planes.count >= capacity
  end

  def weather_status
    true
  end

end
