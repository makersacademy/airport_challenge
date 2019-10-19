# /lib/airport

require './lib/plane'
require './lib/weather'

class Airport

  attr_reader :planes

  def initialize(weather: Weather.new)
    @planes = []
    @capacity = 1
    @weather = weather
  end

  def land(plane)
    raise "cannot land in stormy weather" if @weather.stormy?
    
    @planes << plane
    plane.land
  end

  def takeoff(plane)
    @planes.pop # change so you can control which plane?
    plane.takeoff
  end

  private

  attr_reader :stormy

end
