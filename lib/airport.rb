require 'weather'

class Airport
  attr_reader :conditions, :capacity, :planes, :weather

  DEFAULT_CAPACITY = 20

  def initialize(capacity=DEFAULT_CAPACITY, weather=Weather.new)
    @capacity = capacity
    @weather = weather
    @planes = []
  end

  def clear_for_landing plane
    fail 'Airport is full' if full?
    fail 'Weather is stormy' if weather.stormy?
    planes << plane
    plane.land(self)
  end

  def clear_for_takeoff plane
    fail 'Weather is stormy' if weather.stormy?
    fail 'Plane not registered at this airport' unless registered? plane
    planes.delete(plane)
    plane.take_off
  end

  private
  def full?
    planes.length >= DEFAULT_CAPACITY
  end

  def registered? plane
    planes.include?(plane)
  end
end
