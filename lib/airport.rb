# /lib/airport

require './lib/plane'
require './lib/weather'

class Airport

  attr_reader :planes

  def initialize(weather = Weather.new, capacity = DEFAULTCAPACITY)
    @planes = []
    @weather = weather
    @capacity = capacity
  end

  def land(plane)
    raise "Cannot land in stormy weather" if @weather.stormy?
    raise "Airport is full" if @planes.length >= @capacity

    @planes << plane
    plane.land
  end

  def takeoff(plane)
    raise "Cannot take off in stormy weather" if @weather.stormy?
    raise "Airport is full" if @planes.length >= @capacity

    @planes.pop # change so you can control which plane?
    plane.takeoff
  end

  private

  attr_reader :stormy
  DEFAULTCAPACITY = 1

end
