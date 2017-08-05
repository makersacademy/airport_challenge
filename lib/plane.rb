
class Plane

attr_reader :airborne

def initialize(airborne = true)
  @airborne = airborne
end

def ground_plane
  @airborne = false
end

def airborne?
  @airborne
end

end
