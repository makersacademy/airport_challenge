require_relative "plane.rb"
require_relative "weather.rb"

class Airport
  attr_accessor :planes, :weather
  def initialize()
    @planes = []
    @weather = Weather.new
  end
  def allows_landing(plane)
    planes << plane
    "Aircraft #{plane} has landed"
  end
  def allows_takeoff
    #fail "Bad weather, sorry, no take off!" if weather.bad_weather?
    "Aircraft #{@planes.pop} has departed"
  end
end
