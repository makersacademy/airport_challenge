require_relative "plane"

class Airport
  attr_reader :planes, :capacity
  BAD_WEATHER = 99
  DEFAULT_CAPACITY = 100

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    raise "airport full" if full?
    raise "bad weather: planes cannot land" if bad_weather?

    plane.land(self)
    @planes.push(plane)
  end

  def take_off(plane)
    return "bad weather: plane has not left" if bad_weather?

    plane.take_off(self)

    raise "plane has not left" if plane.airport == self

    @planes.delete(plane)
    return "plane has left"
  end

  def weather
    rand(100)
  end

  def bad_weather?
    weather == BAD_WEATHER
  end

private

  def full?
    planes.count >= capacity
  end
end
