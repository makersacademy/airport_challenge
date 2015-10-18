class Weather
  def forecast
    [:stormy, :cloudy, :sunny, :rainy, :sunny, :rainy, :cloudy, :windy].sample
  end
end

class Airport

  attr_reader :conditions

  def initialize
    @conditions = Weather.new.forecast
  end

  def clear_for_landing plane
    raise 'Airport is full' if full?
    raise 'Weather is stormy' if stormy?
    @plane = plane
  end

  def clear_for_takeoff plane
    raise 'Weather is stormy' if stormy?
  end

  private
  def full?
    @plane
  end

  def stormy?
    conditions == :stormy
  end

end
