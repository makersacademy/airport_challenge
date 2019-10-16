# /lib/airport

require './lib/plane'
require './lib/weather'

class Airport

  attr_reader :planes

  def initialize
    @planes = []
    @capacity = 1
    @weather = Weather.new
  end

  def land(plane)
    @planes << plane
    plane.land
  end

  def takeoff(plane)
    @plane # remove the plane somehow
    plane.takeoff
  end

end
