require_relative 'weather'

class Airport

attr_reader :stored_planes, :capacity, :weather

DEFAULT_CAPACITY = 20

def initialize(capacity=DEFAULT_CAPACITY, weather=Weather.new)
  @stored_planes = []
  @capacity = capacity
  @weather = weather
end

def full?
  stored_planes.count >= capacity
end

def stormy?
  weather.stormy?
end

end
