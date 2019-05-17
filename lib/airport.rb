require './lib/plane'
require './lib/weather'

class Airport
attr_reader :landed
# attr_reader :weather

  def initialize
    @landed = []
    @weather = Weather.new.weather_generator
  end

  def land(plane, weather=@weather)
    raise if weather == 1
    landed << plane
  end


  def take_off(weather=@weather)
    raise if weather == 1
    landed.pop
  end




end
