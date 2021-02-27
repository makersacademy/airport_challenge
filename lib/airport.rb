require_relative 'weather'

class Airport
  attr_accessor :capacity

  DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY, weather)
    @capacity = capacity
    @weather = weather
    @planes = []
  end

  def land(plane)
    fail "Unable to land: airport is full!" if full?
    fail "Unable to land: stormy weather" if stormy?

    plane.land
    @planes.push(plane)
  end

  def take_off(plane)
    fail "Unable to take off: stormy weather" if stormy?

    plane.take_off
    @planes.pop
  end

  private

  def full?
    @planes.count >= @capacity
  end

  def stormy?
    @weather.stormy?
  end

end
