require_relative 'plane.rb'

class Airport

def initialize
  @apron = []
end

def full?
  @apron.count >= 10
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
