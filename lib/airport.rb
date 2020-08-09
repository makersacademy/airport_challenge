require_relative 'plane'
class Airport
  attr_reader :capacity
  DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY)
    @hanger = []
    @capacity = capacity
    @current_weather = [] 
  end

  def land(plane)
    raise "Hanger is full" if full?
    raise "Weather is stormy!" if stormy?

    @hanger << plane
    @hanger[@hanger.length - 1]
  end

  def take_off
    raise "Weather is stormy!" if stormy?

    plane = @hanger.pop
    plane
  end

  def weather 
    weather_arr = ["stormy", "clear", "rain", "snow", "fog"]
    @current_weather << weather_arr.sample
    return @current_weather
  end

  def stormy? 
    @current_weather == "stormy"
  end

  def full?
    @hanger.length >= @capacity
  end
end
