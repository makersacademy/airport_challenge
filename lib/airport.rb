require_relative 'plane'

class Airport

  DEFAULT_CAPACITY = 100
  attr_accessor :capacity

  def initialize(capacity=DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
    @at_airport = false
  end

  def land(plane)
    fail "Airport full" if airport_full?
    @planes << plane
    @at_airport = true
  end

  def take_off
    fail "Takeoff prevented due to storm" if stormy?
    @planes.pop
    @at_airport = false
  end

  def at_airport?
    @at_airport
  end

  def airport_full?
    @planes.count >= DEFAULT_CAPACITY
  end

  def check_weather(weather)
    @stormy = weather == "stormy"
  end

  def stormy?
    @stormy
  end

end
