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

private

def removes_plane_from_airport(plane)
  @planes.select!{|all_planes|
  all_planes != plane}
end

def makes_flying(plane)
   plane.flying!

end

public

def take_off(plane)
    fail "That plane isn't here!" unless present?(plane)
    fail "Conditions too stormy. No planes can take off." if stormy?
    removes_plane_from_airport(plane)
    makes_flying(plane)
    plane
end


def present?(plane)
  @planes.include?(plane)
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
