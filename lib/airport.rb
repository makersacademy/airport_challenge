require_relative 'weather'
require_relative 'plane'

class Airport
  DEFAULT_CAPACITY = 100
  attr_reader :planes, :capacity, :weather

  def initialize(capacity = DEFAULT_CAPACITY, weather)
    @planes = []
    @capacity = capacity
    @weather = weather
  end

  def land(plane)
    raise "Airport full" if full?
    raise "Plane has already landed in the airport" if exist?(plane)
    raise "It is too stormy to land" if @weather.stormy?
    plane.land
    @planes << plane
  end

  def take_off(plane)
    raise "Plane can't take off if it has not landed at the airport" unless exist?(plane)
    raise "It is too stormy to take off" if @weather.stormy?
    plane.take_off
    @planes.delete(plane)
  end

  private
  def full?
    @planes.length >= capacity
  end

  def exist?(plane)
    @planes.include?(plane)
  end

end
