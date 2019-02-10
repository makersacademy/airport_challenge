require_relative "plane"
require_relative "weather"

class Airport
  attr_reader :planes, :capacity
  DEFAULT_CAPACITY = 100

  def initialize(weather = Weather.new, capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
    @weather = weather
  end

  def land(plane)
    raise "airport full" if full?
    raise "bad weather: planes cannot land" if @weather.stormy?

    plane.land(self)
    @planes.push(plane)
  end

  def take_off(plane)
    return "bad weather: plane has not left" if @weather.stormy?

    plane.take_off(self)

    raise "plane has not left" if plane.airport == self

    @planes.delete(plane)
    return "plane has left"
  end

private

  def full?
    planes.count >= capacity
  end
end
