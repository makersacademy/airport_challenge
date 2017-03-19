require_relative "plane.rb"
require_relative "weather.rb"

class Airport

  include Weather

  DEFAULT_CAPACITY = 20

  attr_reader :planes, :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land_plane(plane)
    fail "Landing delayed due stormy weather" if fly_okay? != true
    fail "Airport full!!!" if count_planes >= capacity ####ADD FULL?####
    planes.push(plane)
    plane.land
    "#{plane} has landed successfully"
  end

  def take_off(plane)
    fail "Flight canceled due stormy weather" if fly_okay? != true
    planes.delete(plane)
    plane.take_off
    "#{plane} has now taken off"
  end

  def count_planes
    planes.size
  end

  def fly_okay?
    weather = Weather.check_weather
    return false if weather == "Stormy"
    return true if weather == "Safe to fly"
  end

  def full?
    count_planes >= capacity.size
  end
end
