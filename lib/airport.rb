require_relative 'plane'

class Airport < Plane

attr_reader :planes_docked

def initialize
  @planes_docked = []
  @capacity = 30
end

def plane
  @plane = plane
end

def plane_landed(plane)
  fail 'The airport is full' if @planes_docked.length >= @capacity
  @planes_docked.push(plane)
  "Plane Landed!"
end

def plane_take_off
    @plane
end


end
