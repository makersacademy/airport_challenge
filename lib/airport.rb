require_relative 'plane'
require_relative 'weather'

class Airport

DEFAULT_CAPACITY = 20

attr_accessor :capacity

def initialize(capacity = DEFAULT_CAPACITY)
  @planes = []
  @capacity = capacity
end

def confirm_landing(plane)
fail 'Stormy weather, cannot land' if stormy_weather?
@planes << plane
end

def confirm_takeoff(plane)
  fail 'Stormy weather, cannot takeoff' if stormy_weather?
  @planes.pop
end

def stormy_weather?
weather = Weather.new
weather.stormy?
end

end
