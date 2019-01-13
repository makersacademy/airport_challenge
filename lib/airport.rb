require_relative 'plane'
require_relative 'weather'

class Airport

DEFAULT_CAPACITY = 80

attr_reader :planes, :weather, :capacity

def initialize(capacity=DEFAULT_CAPACITY)
  @capacity = capacity
  @planes = []
  @weather
end

def land(plane, weather)
  @weather = weather
  fail "Landing is forbidden!" if @weather == false
  fail "Airport is full!" if full?
  @planes << plane
  return plane
end

def take_off(plane, weather)
  @weather = weather
  fail "Take off is forbidden!" if @weather == false
  @planes - [plane]
  return @planes.include?(plane)
end

private
def full?
  @planes.count >= @capacity
end

end
