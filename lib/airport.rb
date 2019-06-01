require_relative "weather"

class Airport
  attr_accessor :contents
  MAX_CAPACITY = 1

  def initialize
    @contents = []
  end

  def land(plane, weather)
    raise "Weather preventing landing" if weather.stormy?
    raise "Airport full" if full?
    @contents << plane
  end

  def take_off(plane, weather)
    raise "Weather preventing takeoff" if weather.stormy?
    @contents.delete(plane)
    "Take off complete"

  end

  def full?
    @contents.length == MAX_CAPACITY
  end
end
