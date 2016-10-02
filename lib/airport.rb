# this class takes care of the plane handling.
#Landing and takeoff.
require_relative 'plane'
require_relative 'weather'

class Airport
  attr_reader :planes
  attr_accessor :stormy_weather

  def initialize
    @planes = []
    @stormy_weather = false #it's sunny
  end

  def actual_weather(weather)
    @stormy_weather = weather.stormy #weather might change to stormy
  end

  def take_off
    if @stormy_weather == false #if sunny
      @planes.pop
    else
     'No take off due to storm'
    end
  end

  def land(plane)
    if @stormy_weather == false
      @planes << plane
    else
      'No landing due to storm'
    end

  end

end
