require_relative 'plane'

class Airport

attr_reader :planes
attr_reader :capacity

MAX_CAPACITY = 40

def initialize(capacity=MAX_CAPACITY)
  @planes = []
  @capacity = capacity
end


def land(plane)
    fail "Airport full! No Planes can land!" if full?
    fail "Conditions too stormy. No planes can land." if stormy?
    @planes << plane
end

def removes_plane_from_airport(plane)
  @planes.select!{|all_planes|
  all_planes != plane}
end

def makes_flying(plane)
   plane.flying!

end

def take_off(plane)
    removes_plane_from_airport(plane)
    makes_flying(plane)
    plane
end

private


def stormy?
  conditions = [true, false, false, true, false, false, true, false, false, false]
  conditions.sample
end

def full?
  @planes.length >= MAX_CAPACITY
end




end
