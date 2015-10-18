class Weather
  def forecast
    [:stormy, :cloudy, :sunny, :rainy, :sunny, :rainy, :cloudy, :windy].sample
  end
end

class Airport
  attr_reader :conditions, :capacity, :planes

  DEFAULT_CAPACITY = 20

  def initialize(capacity=DEFAULT_CAPACITY)
    @conditions = Weather.new.forecast
    @capacity = capacity
    @planes = []
  end

  def clear_for_landing plane
    raise 'Airport is full' if full?
    raise 'Weather is stormy' if stormy?
    @planes << plane
    plane.land
  end

  def clear_for_takeoff plane
    raise 'Weather is stormy' if stormy?
    raise 'Plane not registered at this airport' unless registered? plane
    @planes.delete(plane)
    plane.take_off
  end

  private
  def full?
    @planes.length >= DEFAULT_CAPACITY
  end

  def stormy?
    conditions == :stormy
  end

  def registered? plane
    @planes.include?(plane)
  end
end
