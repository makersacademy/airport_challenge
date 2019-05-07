require './lib/plane.rb'

class Airport

  DEFAULT_CAPACITY = 50
  attr_reader :hanger

  def initialize(capacity=DEFAULT_CAPACITY)
    @capacity = capacity
    @hanger = []
  end
  def land(plane)
    raise 'Airport Full - Cannot Land' if @hanger.count >= @capacity
    raise 'Stormy Weather - Cannot Land' if current_weather == "stormy"
    @hanger << plane
  end
  def take_off(plane)
    raise 'Stormy Weather - Cannot Take Off' if current_weather == "stormy"
    @hanger.pop
  end
  def current_weather
    @weather_arr = ["stormy", "sunny", "sunny", "sunny"]
    @weather_arr.sample
  end
end
