require_relative 'plane'
require_relative 'weather'

class Airport

  DEFAULT_CAPACITY = 30

  attr_reader :capacity, :planes

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
    @weather = Weather.new
  end

  def land(plane)
    fail 'stormy weather' if stormy?
    fail 'airport full' if full?
    plane.land
    planes << plane
  end

  def take_off(plane)
    fail 'stormy weather' if stormy?
    fail 'plane not in airport' unless plane_in_airport?(plane)
    plane.fly
    planes.delete(plane)
  end

  private

  attr_reader :weather

  def stormy?
    weather.stormy?
  end

  def full?
    planes.count >= capacity
  end

  def plane_in_airport?(plane)
    planes.include?(plane)
  end

end
