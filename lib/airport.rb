require_relative "plane"
require_relative "weather"

class Airport
  DEFAULT_CAPACITY = 10

  attr_reader :planes
  attr_reader :capacity

  def initialize(weather = Weather.new, capacity = DEFAULT_CAPACITY)
    @planes = []
    @weather = weather
    @capacity = capacity
  end

  def land(plane)
    raise "Plane has already landed" if plane.landed
    raise "Cannot land plane as airport is full" if full?
    raise "Cannot land due to stormy weather" if stormy?
    plane.land(self.to_s)
    @planes << plane
  end

  def take_off(plane)
    raise "Plane has already taken off" if plane.landed == false
    unless plane.airport == self.to_s || plane.airport == nil
      raise "The plane is not in this airport"
    end
    raise "Cannot takeoff due to stormy weather" if stormy?
    plane.take_off
    @planes.delete(plane)
  end

  private

  def stormy?
    @weather.stormy?
  end

  def full?
    planes.count >= @capacity
  end

end
