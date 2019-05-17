require './lib/plane'
require './lib/weather'

class Airport
attr_reader :landed
attr_reader :capacity

DEFAULT_CAPACITY = 50

  def initialize(capacity=DEFAULT_CAPACITY)
    @capacity = capacity
    @landed = []
    @weather = Weather.new.weather_generator
  end

  def land(plane, weather=@weather)
    raise if weather == 1 || full?
    landed << plane
  end


  def take_off(weather=@weather)
    raise if weather == 1
    landed.pop
  end

private
def full?
  landed.length >= capacity
end

end
