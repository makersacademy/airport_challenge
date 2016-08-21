require_relative 'plane'

class Airport
DEFAULT_CAPACITY = 20
def initialize(capacity = DEFAULT_CAPACITY)
  @weather = 1
  @ground = []
  @sky = []
  @capacity = capacity
end

def random_weather
  rand
end

def take_off
  @weather = random_weather
  fail 'Cannot take off due to stormy weather' if @weather < 0.05
  @sky << @ground.pop
end

def landing(plane)
  @weather = random_weather
  fail 'Capacity reached' if full?
  fail 'Cannot land due to stormy weather' if @weather < 0.05
  @ground << plane
end

def full?
  @ground.length >= @capacity
end

end
