class Weather
  OUTLOOKS = [:stormy, :cloudy, :sunny, :rainy]
  def forecast
    OUTLOOKS.sample
  end
end

class Airport
  attr_reader :conditions, :capacity, :planes

  DEFAULT_CAPACITY = 20

  def initialize(capacity=DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def clear_for_landing plane
    fail 'Airport is full' if full?
    fail 'Weather is stormy' if stormy?
    planes << plane
    plane.land(self)
  end

  def clear_for_takeoff plane
    fail 'Weather is stormy' if stormy?
    fail 'Plane not registered at this airport' unless registered? plane
    planes.delete(plane)
    plane.take_off
  end

  private
  def full?
    planes.length >= DEFAULT_CAPACITY
  end

  def stormy?
    Weather.new.forecast == :stormy
  end

  def registered? plane
    planes.include?(plane)
  end
end
