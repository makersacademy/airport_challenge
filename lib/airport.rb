class Airport

attr_accessor :planes
attr_reader :capacity
WEATHER = [:fine, :cloudy, :windy, :stormy]

DEFAULT_CAPACTITY = 20

def initialize(capacity=DEFAULT_CAPACTITY)
  @planes = []
  @capacity = capacity


end

def land(plane)
  raise 'plane is already in the airport' if planes.include?(plane)
  raise "weather is too stormy to land" if weather == :stormy
  raise "airport at max capacity" if at_capacity?
   planes << plane
end

def take_off(plane)
  raise "weather is stormy" if weather == :stormy
  planes.pop
end


def at_capacity?
    planes.count == @capacity
end


def weather
  WEATHER.sample
end

end