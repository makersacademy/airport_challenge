require_relative "weather"

class Airport
  attr_accessor :contents, :capacity

  def initialize(capacity = 5)
    @contents = []
    @capacity = capacity
  end

  def land(plane, weather)
    raise "Weather preventing landing" if weather.stormy?
    raise "Airport full" if full?
    raise "Plane already landed" if @contents.include?(plane)

    @contents << plane
  end

  def take_off(plane, weather)
    raise "Weather preventing takeoff" if weather.stormy?
    raise "Plane already in the sky" unless @contents.include?(plane)

    @contents.delete(plane)
    "Take off complete"
  end

  def full?
    @contents.length == capacity
  end
end
