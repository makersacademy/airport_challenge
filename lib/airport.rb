require_relative "weather"

class Airport
  attr_accessor :contents, :capacity


  def initialize(capacity= 5)
    @contents = []
    @capacity = capacity
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
    @contents.length == capacity
  end
end
