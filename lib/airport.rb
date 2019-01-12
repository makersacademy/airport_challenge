require_relative 'plane'
require_relative 'weather'

class Airport

attr_reader :planes, :weather

def initialize
  @planes = []
  @weather
end

def land(plane, weather)
  @weather = weather
  fail "Landing is forbidden!" if stormy?
  @planes << plane
  return plane
end

def take_off(plane, weather)
  @weather = weather
  fail "Take off is forbidden!" if stormy?
  @planes - [plane]
  return @planes.include?(plane)
end

private
def stormy?
  @weather == false
end

end
