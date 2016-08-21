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

def take_off(plane)
  @sky << plane
end

def landing(plane)
  @ground << plane
end



end
