require_relative 'plane'

class Airport

  attr_accessor :hangar, :capacity, :weather
  DEFAULTCAPACITY = 10

  def initialize(capacity = DEFAULTCAPACITY)
    @hangar = []
    @capacity = capacity
    @weather = "Sunny"
  end

  def land(plane)
    fail "Airport is full" if full?
    @hangar << plane
  end

  def take_off(plane)
    fail "Plane cannot take off due to stormy weather conditions" if @weather == "Stormy"
    @hangar.delete(plane)
  end

  def full?
    @hangar.length >= @capacity
  end

  def override_capacity(number)
    @capacity = number
  end

  def weather
    n = rand (1..10)
    n == 10? @weather = "Stormy" : @weather = "Sunny"
  end

end
