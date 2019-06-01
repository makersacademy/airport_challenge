require_relative "weather"

class Airport
  attr_accessor :contents
  MAX_CAPACITY = 2

  def initialize
    @contents = []
    @current_capacity = 0
  end

  def land(plane, weather)
    raise "Weather preventing landing" if weather.stormy?
    raise "Airport full" if self.full?
    @contents << plane
    @current_capacity += 1
  end

  def take_off(plane, weather)
    raise "Weather preventing takeoff" if weather.stormy?
    @contents.delete(plane)
    @current_capacity -= 1
    "Take off complete"

  end

  def full?
    @current_capacity == MAX_CAPACITY
  end
end
