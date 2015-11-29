require_relative 'plane'

class Airport

MAX_CAPACITY = 40

def initialize(capacity=MAX_CAPACITY)
  @planes = []
  @capacity = capacity
end

attr_reader :planes
attr_reader :capacity

def land(plane)
    fail "Airport full! No Planes can land" if full?
    @planes << plane
end


def take_off(plane)
  plane
end

private

def full?
  @planes.length >= MAX_CAPACITY
end




end
