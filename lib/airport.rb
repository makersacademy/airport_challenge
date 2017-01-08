require './lib/airplane.rb'
require './lib/weather.rb'



class Airport

attr_reader :landed_planes
attr_reader :weather_today

  def initialize
    @landed_planes = []
    @weather_today = Weather.new.weather
  end

  def land_plane(plane)
    stormy?
    @landed_planes << plane
    #print "The plane has landed."
    print_landing
  end

  def takeoff
    stormy?
    @landed_planes.pop
    print_takeoff
  end

  def print_landing
    "The plane has landed"
  end

  def print_takeoff
    "The plane has left"
  end

  def stormy?
    fail "Storm preventing takeoff and landing." if @weather_today == "Stormy"
  end
end
