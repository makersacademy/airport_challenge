require_relative 'plane'

class Airport
DEFAULT_CAPACITY = 20
def initialize(capacity = DEFAULT_CAPACITY)
  @weather = true
  @ground = []
  @sky = []
  @capacity = capacity
end

def stormy
  @weather = false
end

def take_off
  @sky << @ground.pop
end

def landing(plane)
  fail 'Capacity reached' if full?
  @ground << plane
end

def full?
  @ground.length >= @capacity
end

end
