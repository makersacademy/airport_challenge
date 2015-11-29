require_relative 'plane'

class Airport
MAX_CAPACITY = 40

attr_reader :planes
attr_reader :capacity

def initialize(capacity=MAX_CAPACITY)
  @capacity = capacity
  @planes = []
end

def land(plane)
    fail "Airport full! No Planes can land!" if full?
    fail "Conditions too stormy. No planes can land." if stormy?
    plane.landed!
    planes << plane
end

def take_off(plane)
    fail "That plane isn't here!" unless present?(plane)
    fail "Conditions too stormy. No planes can take off." if stormy?
    removes_plane_from_airport(plane)
    makes_flying(plane)
    plane
end

def present?(plane)
  planes.include?(plane)
end


private

def removes_plane_from_airport(plane)
  planes.select!{|all_planes|
  all_planes != plane}
end

def makes_flying(plane)
   plane.flying!
end

def stormy?
  conditions = [true, false, false, true, false, false, true, false, false, false]
  conditions.sample
end

def full?
  planes.length >= MAX_CAPACITY
end

end
