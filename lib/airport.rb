require 'weather'

class Airport
  attr_reader :capacity, :planes, :weather

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY, weather = Weather)
    @capacity = capacity
    @weather = weather
    @planes = []
  end

  def clear_for_landing plane
    allow_landing
    planes << plane
    plane.land(self)
  end

  def clear_for_takeoff plane
    allow_takeoff(plane)
    planes.delete(plane)
    plane.take_off
  end

  private
  def allow_landing
    fail 'Airport is full' if full?
    fail 'Weather is stormy' if weather.stormy?
  end

  def allow_takeoff(plane)
    fail 'Weather is stormy' if weather.stormy?
    fail 'Plane not registered at this airport' unless registered? plane
  end

  def full?
    planes.length >= DEFAULT_CAPACITY
  end

  def registered? plane
    planes.include?(plane)
  end
end
