require_relative 'plane'
require_relative 'weather'


class Airport
  attr_reader :planes,  :capacity

  DEFAULT_CAPACITY = 5

  def initialize(capacity=DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def takeoff(plane)
    weather_check(plane)
    parked_here?(plane)
    empty?
    plane.takeoff
    @planes.delete(plane)
  end

  def land(plane)
    weather_check(plane)
    flying?(plane)
    full?
    plane.land
    @planes << plane
  end

  def weather_check(plane)
    Weather.weather_calc(plane)
  end

  private
  def full?
    fail "The airport is full" if @planes.length >= @capacity
  end

  def empty?
    fail "There are no planes at the airport" if @planes.empty?
  end

  def parked_here?(plane)
    fail "That plane is not at this airport" if !@planes.include?(plane) && !@planes.empty?
  end

  def flying?(plane)
    fail "This plane is not in the air" if plane.ground
  end
end
