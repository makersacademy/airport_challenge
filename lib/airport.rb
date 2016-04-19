require_relative 'plane'
require_relative 'weather'


class Airport
  attr_reader :planes,  :capacity

  DEFAULT_CAPACITY = 5

  def initialize(capacity=DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
    @weather = Weather.new
  end

  def takeoff(plane)
    weather_check(plane)
    fail "That plane is not at this airport" if parked_here?(plane)
    fail "There are no planes at the airport" if empty?
    plane.takeoff
    @planes.delete(plane)
  end

  def land(plane)
    weather_check(plane)
    fail "This plane is not in the air" if flying?(plane)
    fail "The airport is full" if full?
    plane.land
    @planes << plane
  end

  def weather_check(plane)
    @weather.weather_calc(plane)
  end

  private
  def full?
    @planes.length >= @capacity
  end

  def empty?
    @planes.empty?
  end

  def parked_here?(plane)
    !@planes.include?(plane) && !@planes.empty?
  end

  def flying?(plane)
    plane.ground
  end
end
