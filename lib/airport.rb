require_relative 'plane'
require_relative 'weather'

class Airport

attr_reader :planes, :capacity

DEFAULT_CAPACITY = 20

def initialize(capacity = DEFAULT_CAPACITY)
@planes = []
@capacity = capacity
end


def land plane, weather = Weather.new
raise 'Airport if full' if @planes.size >= @capacity
raise "Weather condition is bad, no landing" if weather.stormy?
@planes << plane
"The plane #{plane} has landed"
end

def take_off plane, weather = Weather.new
raise "Weather condition is bad, no take offs" if weather.stormy?
"The plane #{planes.delete plane} has taken off"
end
end
