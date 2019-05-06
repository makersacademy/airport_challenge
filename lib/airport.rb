require './lib/plane.rb'
require './lib/weather.rb'

class Airport

  def initialize(capacity)
    @capacity = capacity
    @hanger = []
  end

  def land(plane)
    raise 'Airport Full - Cannot Land' if @hanger.count >= @capacity
    raise 'Stormy Weather - Cannot Land' if @current_weather == "stormy"
    @hanger << plane
  end

  def take_off(plane)
  end

end
