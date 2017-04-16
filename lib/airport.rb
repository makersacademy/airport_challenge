require_relative 'plane'
require 'weather'
class Airport
attr_reader :landed_planes, :weather

def initialize(weather = Weather.new)
  @landed_planes = []
  @weather = weather
end

def land(plane)
  fail "Too stormy to land!" if weather.stormy?
  plane.land
  @landed_planes.push(plane)
end
def takeoff(plane)
 fail "Too stormy for takeoff!" if weather.stormy?
  plane.takeoff
  @landed_planes.delete(plane)

end
end
