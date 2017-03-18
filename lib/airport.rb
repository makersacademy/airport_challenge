require_relative 'plane'
require_relative 'weather'

class Airport

  def initialize
    @planes = []
    @stormy_weather = false
  end

  def land(plane)
    plane.land
    @planes.push(plane)
  end

  def takeoff(plane)
    @stormy_weather = Stormy_Weather.new.report
    fail 'Unable to takeoff. Weather is stormy.' if @stormy_weather == true
    plane.takeoff
    @planes.pop
  end


end
