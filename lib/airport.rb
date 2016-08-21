require_relative 'plane'

class Airport
DEFAULT_CAPACITY = 20
def initialize(capacity = DEFAULT_CAPACITY)
  @weather = true
  @ground = []
  @sky = []
  @capacity = capacity
end

def random_weather
end

def stormy?
  @weather = false
end

def take_off
  fail 'Cannot take off due to stormy weather' if @weather == false
  @sky << @ground.pop
end

def landing(plane)
  fail 'Capacity reached' if full?
  fail 'Cannot land due to stormy weather' if @weather == false
  @ground << plane
end

def full?
  @ground.length >= @capacity
end

end
