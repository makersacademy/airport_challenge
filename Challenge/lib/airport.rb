
class Airport

DEFAULT_CAPACITY = 2

attr_reader :planes

def initialize
@planes = []
end

def land_plane(plane)
  fail "Docking station is full" if full?
  @planes << plane
end

def take_off(plane)
  @planes.delete(plane)
end

private

def full?
  @planes.count >= DEFAULT_CAPACITY
end


end


class Plane

def initialize 

end

end