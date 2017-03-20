require_relative 'plane'
require_relative 'weather'

class Airport
  attr_reader :planes, :weather

  DEFAULT_CAPACITY = 100

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
    @weather = Weather.new
  end

  def land(plane)
    raise "The airport is full" if full?
    raise "Stormy weather. Landing not permitted." if weather.stormy?
    raise "Plane has landed" if plane.landed
    plane.landing
    planes << plane
  end

  def take_off(plane)
    raise "The plane can't be found at the airport" unless planes.include?(plane)
    raise "Stormy weather. No planes flying." if weather.stormy?
    plane.departuring
    planes.delete(plane)
  end

  private
  attr_reader :capacity

  def full?
    planes.count >= capacity
  end

end
