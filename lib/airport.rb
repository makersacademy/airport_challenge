require_relative 'plane'

class Airport

attr_reader :planes, :weather

def initialize
  @planes = []
  @weather
end

def land(plane)
  fail "Landing is forbidden!" if @weather
  @planes << plane
  return plane
end

def take_off(plane)
  fail "Take off is forbidden!" if @weather
  @weather
  @planes - [plane]
  return @planes.include?(plane)
end

def weather
  @weather = Stormy.new
end

end

class Stormy
end
