# this class takes care of the plane handling.
#Landing and takeoff.
require_relative 'plane'
require_relative 'weather'

class Airport
  attr_reader :planes

  def initialize
    @planes = []
  end

  def actual_weather
    weather = Weather.new
    weather.stormy
  end

  def take_off(stormy_weather)
    if stormy_weather == false
      @planes.pop
    else
     'No take off due to storm'
    end
  end

  def land(plane)
    @planes << plane
  end

end
