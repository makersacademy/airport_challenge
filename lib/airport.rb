require_relative 'plane.rb'

class Airport
DEFAULT_CAPACITY = 20
attr_reader :capacity

def initialize(capacity = DEFAULT_CAPACITY)
  @capacity = capacity
  @apron = []
end

def full?
  @apron.count >= @capacity
end

def park(plane)
  if self.full?
    raise "The airport is full, abort landing!"
    plane.landed = false
  else
  @apron << plane
end
end

end
