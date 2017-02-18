require_relative 'plane'
require_relative 'weather'

class Airport

DEFAULT_CAPACITY = 20

attr_reader :capacity

def initialize(capacity = DEFAULT_CAPACITY)
  @capacity = capacity
  @planes =[]
  @weather = Weather.new

end

def weather_stormy?
  @weather.stormy?
end

def full?
  @planes.count >= capacity
end

def land(plane)
  fail 'Cannot land plane because of stormy weather or at full capacity' if self.weather_stormy? || self.full?
  @planes << plane
  plane.landed
end

def take_off(plane)
  fail 'Cannot let plane take off because of stormy weather' if self.weather_stormy?
  plane.taken_off
end

end
