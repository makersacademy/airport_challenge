require_relative 'plane'
require_relative 'weather'

class Airport

attr_reader :planes, :weather

def initialize #(weather = true)
  @planes = []
  @weather #= weather
end

def land(plane, weather)
  fail "Landing is forbidden!" if false
  @weather # will work as long as either land or take_off has called @weather
  @planes << plane
  return plane
end

def take_off(plane, weather)
  fail "Take off is forbidden!" if false
  @weather
  @planes - [plane]
  return @planes.include?(plane)
end

end
