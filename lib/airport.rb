class Weather
  def forecast
    [:stormy, :cloudy, :sunny, :rainy, :sunny, :rainy, :cloudy, :windy].sample
  end
end

class Airport
  attr_reader :conditions, :capacity

  DEFAULT_CAPACITY = 20
  
  def initialize(capacity=DEFAULT_CAPACITY)
    @conditions = Weather.new.forecast
    @capacity = capacity
  end

  def clear_for_landing plane
    raise 'Airport is full' if full?
    raise 'Weather is stormy' if stormy?
    @plane = plane
  end

  def clear_for_takeoff plane
    raise 'Weather is stormy' if stormy?
    raise 'Plane not registered at this airport' if unregistered? plane
  end

  private
  def full?
    @plane
  end

  def stormy?
    conditions == :stormy
  end

  def unregistered? plane
    @plane != plane
  end
end
