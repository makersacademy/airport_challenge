require_relative "plane.rb"
require_relative "weather.rb"

class Airport

  include Weather

  DEFAULT_CAPACITY = 20

  attr_reader :planes
  attr_accessor :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land_plane(plane)
    fail "Landing delayed due stormy weather" unless fly_okay?
    fail "Airport full!!!" if full?
    planes.push(plane)
    plane.land
    "#{plane} has landed successfully"
  end

  def take_off(plane)
    fail "This plane isn't here!" if plane_in_airport?(plane) !=true
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
    weather == :stormy ? false : true
  end

  def full?
    count_planes >= capacity
  end

  private

  def plane_in_airport?(plane)
    planes.include?(plane)
  end
end
