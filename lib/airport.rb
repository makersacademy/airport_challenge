require_relative 'weather'

class Airport
  DEFAULT_CAPACITY = 1
  attr_reader :planes, :capacity, :weather

  def initialize(capacity: DEFAULT_CAPACITY, weather: Weather.new)
    @planes = []
    @capacity = capacity
    @weather = weather
  end

  def land(plane)
    fail 'This plane has already landed' if planes.include?(plane)
    fail 'This airport can\'t receive more planes' if full?
    fail 'Landing not permitted due to stormy weather' if weather.stormy?
    plane.land
    planes.push(plane)
  end

  def take_off(plane)
    fail 'This plane has not landed yet' unless planes.include?(plane)
    fail 'Take off not permitted due to stormy weather' if weather.stormy?
    plane.take_off
    planes.delete(plane)
  end

  def full?
    planes.length >= capacity
  end
end
